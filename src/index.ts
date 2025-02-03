import { Context, Hono } from 'hono';
import { cors } from 'hono/cors';
// import { swaggerUI } from '@hono/swagger-ui';
// import YAML from 'yaml';

import { drizzle } from 'drizzle-orm/d1';
import { eq, gte, lte, like, or, and, sql, count, asc, desc } from 'drizzle-orm';
import * as schema from './db/schema';
import { SQLiteColumn } from 'drizzle-orm/sqlite-core';

export interface Env {
	DB: D1Database;
}

const { usersTable, eventsTable } = schema;

export const initDbConnect = (env: D1Database) => drizzle(env, { schema });

type Environment = Env & {
	Bindings: {
		DB: D1Database;
		ENV_TYPE: 'dev' | 'prod';
		API_KEY: string;
	};
}

function convertDate(date: string | number): string | undefined {
  try {
    let convertedDate
    if (typeof date === 'number') {
      convertedDate = new Date(date)
    } else {
      convertedDate = new Date(date)
    }

	if (convertedDate instanceof Date && !isNaN(convertedDate.getTime())) {
      return convertedDate.toISOString().slice(0, 19).replace('T', ' ')
    }
  } catch (e) {
    return undefined
  }
}

const app = new Hono<Environment>();
app.use('/api/*', cors());

// api key middleware

app.use('/api/*', async (c: Context<Environment>, next: () => Promise<void>) => {
	const apiKey = c.req.header('x-api-key');

	if (apiKey !== c.env.API_KEY) {
		return c.json({ message: 'Invalid API key' }, 401);
	}

	await next();
});

// EVENTS TABLE SCHEMA
//
// `id` text(36) PRIMARY KEY DEFAULT (lower(hex(randomblob(16)))) NOT NULL,
// `title` text(50) NOT NULL,
// `description` text(200) DEFAULT '',
// `location` text(100) NOT NULL,
// `date` text NOT NULL,
// `price` real DEFAULT 0 NOT NULL,
// `image` text DEFAULT '',
// `userId` text,
// `created_at` text DEFAULT (CURRENT_TIMESTAMP),
// `updated_at` text DEFAULT (CURRENT_TIMESTAMP),

// -------------------- READ -------------------- //
app.get('/api/v1/events', async (c: Context<Environment>) => {
	const db = drizzle(c.env.DB);

	const {
		limit = '10',
		offset = '0',
		search,
		min_date,
		max_date,
		sort,
		order
	} = c.req.query();

	// validate inputs
	let errors = [];

	// convert dates to ISO format
	const min_date_iso = convertDate(min_date);
	const max_date_iso = convertDate(max_date);

	if (min_date && !min_date_iso) {
		errors.push(`Invalid "min_date" query: ${min_date}. Date must be in ISO format (YYYY-MM-DD HH:MM:SS) or a Unix timestamp (https://www.w3.org/TR/NOTE-datetime)`);
	}

	if (max_date && !max_date_iso) {
		errors.push(`Invalid "max_date" query: ${max_date}. Date must be in ISO format (YYYY-MM-DD HH:MM:SS) or a Unix timestamp (https://www.w3.org/TR/NOTE-datetime)`);
	}

	// sort and order validation
	if (sort && typeof sort !== 'string' && sort !== 'title' && sort !== 'location' && sort !== 'date' && sort !== 'price' && sort !== 'created_at' && sort !== 'updated_at') {
		errors.push(`Invalid "sort" query ${sort}. Sort must be a string value of either "title", "description", "location", "date", "price"`);
	}

	if (order && typeof order !== 'string' && order !== 'asc' && order !== 'desc') {
		errors.push(`Invalid "order" query ${order}. Order must be either "asc" or "desc"`);
	}

	// limit and offset validation
	if (limit && (isNaN(parseInt(limit))) || parseInt(limit) < 1 || parseInt(limit) > 10) {
		errors.push(`Invalid "limit" query ${limit}. Limit must be a number between 1 and 10`);
	}

	if (offset && (isNaN(parseInt(offset))) || parseInt(offset) < 0) {
		errors.push(`Invalid "offset" query ${offset}. Offset must be a number greater than or equal to 0`);
	}

	if (errors.length > 0) {
		return c.json({ errors }, 400);
	}

	// set sort field based on the sort query
	let sortField: SQLiteColumn | undefined;

	switch (sort) {
		case 'title':
			sortField = eventsTable.title;
			break;
		case 'description':
			sortField = eventsTable.description;
			break;
		case 'location':
			sortField = eventsTable.location;
			break;
		case 'date':
			sortField = eventsTable.date;
			break;
		case 'price':
			sortField = eventsTable.price;
			break;
		case 'created_at':
			sortField = eventsTable.created_at;
			break;
		case 'updated_at':
			sortField = eventsTable.updated_at;
			break;
		default:
			sortField = eventsTable.created_at;
			break;
	}

	const result = await db.select()
		.from(eventsTable)
		.where(
			and(
				search ?
					or(
						like(sql`upper(${eventsTable.title})`, `%${search.toUpperCase()}%`),
						like(sql`upper(${eventsTable.description})`, `%${search.toUpperCase()}%`)
					) : undefined,
				min_date ? gte(eventsTable.date, min_date) : undefined,
				max_date ? lte(eventsTable.date, max_date) : undefined
			)
		)
		.orderBy(sort ? (order === 'desc') ? desc(sortField) : asc(sortField) : asc(eventsTable.created_at))
		.limit(parseInt(limit))
		.offset(parseInt(offset));

	if (!result) {
		return c.json({ message: 'No events found' }, 404);
	}

	return c.json({
		result, meta: {
			pagination: {
				limit: parseInt(limit),
				offset: parseInt(offset),
			},
			sorting: {
				sort: sort,
				order: order
			},
			filters: {
				search: search,
				min_date: min_date_iso,
				max_date: max_date_iso
			}
		}
	}, 200);
});

// -------------------- CREATE -------------------- //

app.post('/api/v1/events', async (c: Context<Environment>) => {
	try {
	const db = drizzle(c.env.DB);

	const { title, description, location, date, price, image } = await c.req.json();

	const event = await db.insert(eventsTable)
		.values({
			title,
			description,
			location,
			date,
			price,
			image,
		})
		.returning();

	return c.json(event, 201);
	} catch (error) {
		if (error instanceof Error) {
			c.json({ message: error.message }, 500);
		} else {
			c.json({ message: 'An unknown error occurred' }, 500);
		}
	}
});

// -------------------- UPDATE -------------------- //

app.put('/api/v1/events/:id', async (c: Context<Environment>) => {
	const db = drizzle(c.env.DB);

	const { title, description, location, date, price, image } = await c.req.json();
	const { id } = c.req.param();

	const event = await db.update(eventsTable)
		.set({
			title,
			description,
			location,
			date,
			price,
			image,
			updated_at: sql`CURRENT_TIMESTAMP`
		})
		.where(eq(eventsTable.id, id))
		.returning();

	return c.json(event, 200);
});

// -------------------- DELETE -------------------- //

app.delete('/api/v1/events/:id', async (c: Context<Environment>) => {
	const db = drizzle(c.env.DB);

	const { id } = c.req.param();

	const deleted = await db.delete(eventsTable)
		.where(eq(eventsTable.id, id))
		.returning();

	return c.json({ deleted }, 200);
});

// -------------------- READ BY ID -------------------- //

app.get('/api/v1/events/:id', async (c: Context<Environment>) => {
	const db = drizzle(c.env.DB);

	const { id } = c.req.param();

	const event = await db.select()
		.from(eventsTable)
		.where(eq(eventsTable.id, id))
		.get();

	if (!event) {
		return c.json({ message: 'Event not found' }, 404);
	}

	return c.json(event, 200);
});

// -------------------- SWAGGER -------------------- //

// TODO: Add Swagger UI

// app.use('/ui', (c) => {
// 	return c.html(`
// 		<!DOCTYPE html>
// 		<html>
// 			<head>
// 				<title>Swagger UI</title>
// 			</head>
// 			<body>
// 			<h1>Swagger UI</h1>
// 			</body>
// 		</html>
// 	`);
// });

export default app;
