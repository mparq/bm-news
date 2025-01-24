# Bhakti Marga News

This repo has code for the Bhakti Marga News app.


## Get started

### News frontend server
see [./bm-news-frontend/README.md](./bm-news-frontend/README.md).

### Run local news database
This is useful for local development on the frontend integrated w/ actual data shape.

Make sure you have [docker](https://www.docker.com/) installed and accessible on path.
 
Open up a terminal and run the following to spin up a local postgres sql server. Keep this
terminal running as you develop.
```sh
# open up one terminal and run the following
# bulid and spin up local postgres database
docker-compose -f docker-compose.yaml up --build
```

Open up a different terminal and build and populate the database schema. You can re-run this script whenever you want to re-generate the schema. Just know that it will also reset any data in the database.

```sh
# create schema and populate initial data
./scripts/db_schema_recreate
```




