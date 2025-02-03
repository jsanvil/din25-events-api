## Test API for DIN 2025 events application

This is a test API for the DIN 2025 events application. It is a Cloudflare Worker that uses a D1 database to store and retrieve events.

### API URL

- [https://din25-events.jacinto-sanchez.workers.dev/api/v1/events](https://din25-events.jacinto-sanchez.workers.dev/api/v1/events)

### Endpoints

- `GET /api/v1/events`: Get events list. Supports query parameters for search, date filtering, pagination, sorting. (See below)
- `GET /api/v1/events/:id`: Get an event by id.
- `POST /api/v1/events`: Create a new event.
- `PUT /api/v1/events/:id`: Update an event by id.
- `DELETE /api/v1/events/:id`: Delete an event by id.

### Event schema

```json
{
  "id": "EVENT_ID",
  "title": "Event Title",
  "description": "Event Description",
  "location": "Event Location",
  "date": "2025-01-01 00:00",
  "price": 0.0,
  "image": "https://example.com/image.jpg"
}
```

### Query parameters

Filters:

- `search`: Search events containing the given string in the name or description.
- `min_date`: Filter events by minimum date. (ISO 8601 formatted date or Unix timestamp)
- `max_date`: Filter events by maximum date. (ISO 8601 formatted date or Unix timestamp)

Pagination:

- `limit`: Limit the number of events returned. (Integer between 1 and 10)
- `offset`: Offset the number of events returned. (Integer >= 0)

Sorting:

- `sort`: Sort events by a field. (String) "title" | "location" | "date" | "price"
- `order`: Order events by a field. (String) "asc" | "desc"

_Examples:_

- `GET /api/v1/events?search=Event`: Search events containing the string "Event".
- `GET /api/v1/events?min_date=2025-01-01`: Filter events by minimum date.
- `GET /api/v1/events?max_date=2025-12-31`: Filter events by maximum date.
- `GET /api/v1/events?min_date=2025-01-01&max_date=2025-12-31`: Filter events by minimum and maximum date.
- `GET /api/v1/events?search=Event&min_date=2025-01-01`: Search events containing the string "Event" and filter by minimum date.
- `GET /api/v1/events?limit=10&offset=0`: Limit the number of events returned and offset the results.
- `GET /api/v1/events?sort=title&order=asc`: Sort events by title in ascending order.
- `GET /api/v1/events?sort=date&order=desc`: Sort events by date in descending order.
- `GET /api/v1/events?search=Event&min_date=2025-01-01&limit=10&offset=0&sort=title&order=asc`: Search events containing the string "Event", filter by minimum date, limit the number of events returned, offset the results, sort by title in ascending order.

### Authentication

Header token authentication is required for POST, PUT, and DELETE requests.

`x-api-key`: API key for authentication.

A valid `API_KEY` would be available in students Moodle.

_Example:_

```shell
curl -X POST https://din25-events.jacinto-sanchez.workers.dev/api/v1/events \
-H "x-api-key: API_KEY" \
-H "Content-Type: application/json" \
-d '{"title": "New Event", "description": "This is a new event.", "location": "New Location", "date": "2025-01-01", "price": 0}'
```

### Examples

Get default event list:

```shell
curl -X GET -H "x-api-key: API-KEY" https://din25-events.jacinto-sanchez.workers.dev/api/v1/events
```

```js
fetch(
  'https://din25-events.jacinto-sanchez.workers.dev/api/v1/events',
  {
    method: 'GET',
    headers: {
      'x-api-key': 'API-KEY'
    }
  })
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

Get an event by id:

```shell
curl -X GET -H "x-api-key: API-KEY" https://din25-events.jacinto-sanchez.workers.dev/api/v1/events/1
```

```js
fetch('https://din25-events.jacinto-sanchez.workers.dev/api/v1/events/1', {
  headers: {
    'x-api-key': 'API-KEY'
  }})
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

Create a new event:

```shell
curl -X POST -H "x-api-key: API-KEY" https://din25-events.jacinto-sanchez.workers.dev/api/v1/events \
-H "Content-Type: application/json" \
-d '{"title": "New Event", "description": "This is a new event.", "location": "New Location", "date": "2025-01-01", "price": 0}'
```

```js
fetch(
  'https://din25-events.jacinto-sanchez.workers.dev/api/v1/events',
  {
    method: 'POST',
    headers: {
      'x-api-key': 'API-KEY',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      title: 'New Event',
      description: 'This is a new event.',
      location: 'New Location',
      date: '2025-01-01',
      price: 0
    })
  })
  .then(response => response.json())
  .then(data => console.log(data.result))
  .catch(error => console.error(error));
```

Update an event by id:

```shell
curl -X PUT -H "x-api-key: API-KEY" https://din25-events.jacinto-sanchez.workers.dev/api/v1/events/1 \
-H "Content-Type: application/json" \
-d '{"title": "Updated Event", "description": "This is an updated event.", "location": "Updated Location", "date": "2025-12-31", "price": 100}'
```

```js
fetch(
  'https://din25-events.jacinto-sanchez.workers.dev/api/v1/events/1',
  {
    method: 'PUT',
    headers: {
      'x-api-key': 'API-KEY',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      title: 'Updated Event',
      description: 'This is an updated event.',
      location: 'Updated Location',
      date: '2025-12-31',
      price: 100
    })
  })
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

Delete an event by id:

```shell
curl -X DELETE -H "x-api-key: API-KEY" https://din25-events.jacinto-sanchez.workers.dev/api/v1/events/1
```

```js
fetch('https://din25-events.jacinto-sanchez.workers.dev/api/v1/events/1', {
  method: 'DELETE',
  headers: {
    'x-api-key': 'API-KEY'
  }})
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

Query parameters example:

```shell
curl -X GET -H "x-api-key: API-KEY" https://din25-events.jacinto-sanchez.workers.dev/api/v1/events?search=new&min_date=2025-01-01&sort=title&order=asc
```

```js
fetch(
  'https://din25-events.jacinto-sanchez.workers.dev/api/v1/events?search=new&min_date=2025-01-01&sort=title&order=asc',
  {
    method: 'GET',
    headers: {
      'x-api-key': 'API-KEY'
    }
  })
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

Example response:

```json
{
  "result": [
    {
      "id": "463ba06ede3c49d2fd032610fc6ff79b",
      "title": "New Year Eve Party",
      "description": "Celebrate the end of the year with a bang",
      "location": "Times Square",
      "date": "2025-12-31",
      "price": 150,
      "image": "https://picsum.photos/seed/newyearseveparty/300/200",
      "userId": null,
      "created_at": "2025-02-02 19:58:29",
      "updated_at": "2025-02-02 19:58:29"
    },
    {
      "id": "71b9ea40c844973e94da5c144fe040bc",
      "title": "Book Fair",
      "description": "Discover new books and authors",
      "location": "Library Plaza",
      "date": "2025-01-25",
      "price": 5,
      "image": "https://picsum.photos/seed/bookfair/300/200",
      "userId": null,
      "created_at": "2025-02-02 19:58:29",
      "updated_at": "2025-02-02 19:58:29"
    },
    {
      "id": "8b37543bd18e1fd34152459e6be109a3",
      "title": "Pet Adoption Fair",
      "description": "Find your new best friend",
      "location": "Animal Shelter",
      "date": "2025-10-15",
      "price": 0,
      "image": "https://picsum.photos/seed/petadoptionfair/300/200",
      "userId": null,
      "created_at": "2025-02-02 19:58:29",
      "updated_at": "2025-02-02 19:58:29"
    },
    {
      "id": "806bfc1f78b165c2f61e46131d54c94c",
      "title": "New Year Day Parade",
      "description": "Celebrate the new year",
      "location": "Main Street",
      "date": "2025-01-01",
      "price": 0,
      "image": "https://picsum.photos/seed/newyearsdayparade/300/200",
      "userId": null,
      "created_at": "2025-02-02 19:58:29",
      "updated_at": "2025-02-02 19:58:29"
    }
  ],
  "meta": {
    "pagination": {
      "limit": 10,
      "offset": 0
    },
    "order": {
      "sort": "title",
      "order": "asc"
    },
    "filters": {
      "search": "new",
      "min_date": "2025-01-01"
    }
  }
}
```


## Project recreation steps

### Requirements

- [Node.js](https://nodejs.org/)
- [Cloudflare account](https://dash.cloudflare.com/)
- [Wrangler](https://developers.cloudflare.com/workers/cli-wrangler/install-update)
- [D1](https://developers.cloudflare.com/workers/cli-wrangler/durable-objects)

### Libraries

- [Drizzle-orm](https://orm.drizzle.team/) - ORM to interact with D1 database
- [Hono](https://hono.dev/docs/) - Web application framework, used for api development

### Initialize a new Cloudflare project:

```shell
wrangler init din25-events
```

- Url: https://din25-events.jacinto-sanchez.workers.dev/

- Api Url: https://din25-events.jacinto-sanchez.workers.dev/api/v1/events

### Create a new Cloudflare D1 database:

```shell
wrangler d1 create din25-events

[[d1_databases]]
binding = "DB"
database_name = "din25-events"
database_id = "d396d44e-0189-4b44-9279-33ec97b39e37"
```

### Drizzle-orm

[Get started with Drizzle and D1](https://orm.drizzle.team/docs/get-started/d1-new)

### Environment variables

Copy the `.env.example` file to `.env` and set the environment variables.

In Cloudflare dashboard, go to **Workers & Pages** -> _**project**_ -> **settings** -> **Variables and Secrets** -> **+Add** and add the following environment variable:

- Type: `Secret`
- Value name: `API_KEY`
- Value: `YOUR_API_KEY`

```shell
CLOUDFLARE_ACCOUNT_ID = YOUR_ACCOUNT_ID
CLOUDFLARE_DATABASE_ID = YOUR_DATABASE_ID
CLOUDFLARE_D1_TOKEN = YOUR_D1_TOKEN
```

You can find `accountId`, `databaseId` and `token` in [Cloudflare dashboard](https://dash.cloudflare.com/login?).

To get `accountId` go to **Workers & Pages** -> **Overview** -> copy **Account ID** from the **right sidebar**.
To get `databaseId` open D1 database you want to connect to and copy **Database ID**.
To get `token` go to **My profile** -> **API Tokens** and create token with D1 edit permissions.

### node scripts

- `npm run deploy` - Deploy the worker to Cloudflare.
- `wrangler d1 execute din25-events --remote --file src/db/insertEvents.sql` - Load test data to the D1 database.
