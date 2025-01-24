# Bhakti Marga News Frontend

A custom frontend for the Bhakti Marga News site.

## Overview

This project uses the [fresh](https://fresh.deno.dev/docs/getting-started) web framework, which is a deno (basically, nodeJS) framework. If you're used to using npm and js, this project will be familiar.

Just note that this is JS (typescript here) but it is running server-side, not in the browser unless we specifically opt into [interactivity islands](https://fresh.deno.dev/docs/getting-started/adding-interactivity). Aside from this, all HTML content is rendered on the server before sending to client.

The basic tech behind the scenes uses Preact which is React but lighter-weight. Our use case focuses on server-side rendering most things, and using Preact mainly for templating and components. e.g. loading all the stories for the front page then rendering the front page html on the server before sending down.

For easier integration, I've taken the data model from Shopify and put it into a SQL database so that our app flow can be simpler from the perspective of the frontend.
You can run the PostgresSQL database locally by following instructions at [../README.md](../README.md).

Usual flow:
1. We receive request for a page.
2. Server queries database to get all information for page (e.g. frontPageArticles).
3. Server renders preact template and sends to browser.

## Development

### Setup
- Install [docker](https://www.docker.com/). docker is used to run the local database stack.
- Install [deno](https://docs.deno.com/runtime/getting_started/installation/)
- `deno run start` will start the server in watch mode, restarting on changes.

### Top-level routes
We have a small number of top-level routes for the current news frontend:
- `/`: The home page. Renders the top articles - this is likely the most important page but it should also be fast. Also should be fully-loaded on server except for in the future, the search component.
- `/article/<handle>`: Individual article page. If you have the local database set up, you can check [http://localhost:8000/article/test-article](http://localhost:8000/article/test-article)
- `/category/<category>`: Category page shows all latest articles for that category.

### Localization and translation

There are two types of localization and translation that we have to support in this app.
1. **codebase**: Text which is rendered statically (e.g. strings in the codebase). This should be handled with json per-locale and can be integrated as we support more languages and add more strings with more of a "workflow", where check-ins detect new strings that need to be translated and checked into the codebase.
2. **database**: Text which is "content", dynamic. e.g. article content mainly w/ descriptions. This is supported via the `*_translations` tables in the database which should have all the translateable strings as columns for the corresponding entity (this is similar structure of folder-based json localization)

### Supporting a new route

First, I recommend reading the [fresh docs](https://fresh.deno.dev/docs/getting-started/create-a-route). It is pretty quick
and should give an overview. The framework is a nice middle-ground between more heavy-weight frameworks (there's not too much
abstraction over the html) while also giving us a good templating and component flow.

A basic development flow would be:
- Determine what shape of data we need to support the frontend functionality.
- If schema changes are needed, we can update `src/db/schema.ts` and create a migration (see below).
- Create route in `src/routes/` for the page/s or routes we're supporting.
- Create a query in `src/db/queries.ts` to query the database and get the shape the UI needs.
- Use the new query in your route component/s to render the page.

### Working with database

This project uses a lightweight node ORM, [drizzle-orm](https://orm.drizzle.team/docs/select).

At a high-level `drizzle`:
- provides a convenient and type-safe query builder (`db.select().from()`, ...). see `src/db/queries.ts`.
- syncs an ORM schema which is kept in sync with the database at `src/db/schema.ts` and `src/db/relations.ts`. these files need to be kept in sync with the db, so if we need to make changes to them in the app, run `deno db:generate-migrations`

Database commands:
- `deno db:generate-migrations`:
    - run if you make updates to `src/db/schema.ts` it will generate a migration which you can
apply on the database. these migrations will be run in CI and should be associated with the app code and also be backwards-
compatible e.g. do not delete columns or rename columns. if needed, use `{columnname}_v2`.
- `deno db:pull`:
    - run when schema changes have been made directly on the database. this command shouldn't be needed from this
project (or, instead it will be the reverse, and we rely just on this command to keep the project's ORM synced and manage db
schema migrations externally).
    - **NOTE:** this command will generate `drizzle/schema.ts` and `drizzle/relations.ts`. to make these
accessible to the source code, we need to move them to the `src/db` folder: `cp drizzle/schema.ts drizzle/relations.ts src/db`.
Afterwards, the `drizzle/schema.ts` and `drizzle/relations.ts` files can be removed until the next pull.


## Setup
Install [deno](https://fresh.deno.dev/docs/getting-started)




Your new Fresh project is ready to go. You can follow the Fresh "Getting
Started" guide here: https://fresh.deno.dev/docs/getting-started

### Usage

Make sure to install Deno: https://deno.land/manual/getting_started/installation

Then start the project:

```
deno task start
```

This will watch the project directory and restart as necessary.
