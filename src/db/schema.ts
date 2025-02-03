import { sql } from 'drizzle-orm';
import { sqliteTable, integer, text, real, index, check } from 'drizzle-orm/sqlite-core';

export const usersTable = sqliteTable(
  'users',
  {
    id: text('id', { length: 36 }).primaryKey().default(sql`(lower(hex(randomblob(16))))`),
    name: text('name', { length: 128 }).default('noname'),
    username: text('username', { length: 128 }).notNull().unique(),
    email: text('email', { length: 128 }).notNull().unique(),
    password: text('password', { length: 128 }).notNull(),
    role: text('role', { length: 128 }).default('user'),
    created_at: text('created_at').default(sql`(CURRENT_TIMESTAMP)`),
    updated_at: text('updated_at').default(sql`(CURRENT_TIMESTAMP)`),
  });

export const eventsTable = sqliteTable(
  'events',
  {
    id: text('id', { length: 36 }).primaryKey().default(sql`(lower(hex(randomblob(16))))`),
    title: text('title', { length: 50 }).notNull(),
    description: text('description', { length: 200 }).default(''),
    location: text('location', { length: 100 }).notNull(),
    date: text('date').notNull(),
    price: real('price').notNull().default(0),
    image: text('image').default(''),
    userId: text('userId').references(() => usersTable.id),
    created_at: text('created_at').default(sql`(CURRENT_TIMESTAMP)`),
    updated_at: text('updated_at').default(sql`(CURRENT_TIMESTAMP)`),
  },
  (table) => ({
    indexes: [
      index('price').on(table.price),
      index('name').on(table.title),
      index('description').on(table.description),
      index('date').on(table.date)
    ],
    checkConstraints: [check('price', sql`price >= 0`)],
  })
);