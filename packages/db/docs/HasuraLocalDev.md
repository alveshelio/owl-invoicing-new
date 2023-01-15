# Hasura Local Environment Setup

## Requirements

### Hasura CLI

[Install Hasura CLI Reference](https://hasura.io/docs/latest/graphql/core/hasura-cli/install-hasura-cli/) Follow the instructions on this page based on your OS

### Docker

[Download Docker](https://docs.docker.com/desktop/mac/install/)

### PostgreSQL

Install postgres through **brew**. `brew update` and `brew install postgres`

`psql --version` should give you the installed version

## Hasura GraphQL Engine

Create a `docker-compose.yaml` file at the root of the project and paste the following content

```yaml
version: "3.6"
services:
  postgres:
    image: postgres:12
    restart: always
    volumes:
      - db_data:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: postgrespassword
  graphql-engine:
    image: hasura/graphql-engine:v2.8.4
    ports:
      - "8080:8080"
    depends_on:
      - "postgres"
    restart: always
    environment:
      ## Auto apply migrations and metadata when server starts
      # HASURA_GRAPHQL_MIGRATIONS_DIR: /hasura/migrations
      # HASURA_GRAPHQL_METADATA_DIR: /hasura/metadata
      ## postgres database to store Hasura metadata
      HASURA_GRAPHQL_METADATA_DATABASE_URL: postgres://postgres:postgrespassword@postgres:5432/postgres
      ## this env var can be used to add the above postgres database to Hasura as a data source. this can be removed/updated based on your needs
      HASURA_GRAPHQL_DATABASE_URL: postgres://postgres:postgrespassword@postgres:5432/postgres
      ## enable the console served by server
      HASURA_GRAPHQL_ENABLE_CONSOLE: "true" # set to "false" to disable console
      ## enable debugging mode. It is recommended to disable this in production
      HASURA_GRAPHQL_DEV_MODE: "true"
      HASURA_GRAPHQL_ENABLED_LOG_TYPES: startup, http-log, webhook-log, websocket-log, query-log
      ## uncomment next line to set an admin secret
      HASURA_GRAPHQL_ADMIN_SECRET: a-super-secret
      ## uncomment next line to set the JWT token secret
      HASURA_GRAPHQL_JWT_SECRET: '{ "type": "HS256", "key": "9f44dba6a2009a7e8cf9867e7c25fa6c" }'

volumes:
  db_data:
```

This will create a local postgres DB and Hasura GraphQL engine.
The GraphQL engine will be hosted on `http://localhost:8080`

### Update Hasura GraphQL Engine locally

To update Hasura locally edit `graphql-engine` => `image` in `docker-compose.yaml` file. Change `hasura/graphql-engine:v2.8.4` this to the latest version.

## Migrations and Metadata

**_This process applies to Hasura Cloud or a Hasura GraphQL Engine running locally_**

### Config file

Create file `config.yaml` and paste this content

```yaml
version: 3
endpoint: http://localhost:8080
metadata_directory: metadata
actions:
  kind: synchronous
  handler_webhook_baseurl: http://localhost:3000
```

### Migrations

#### Get migrations from hasura cloud

    `hasura migrate create init --from-server --endpoint https://your-subdomain.hasura.app --admin-secret your-secret`

### Metadata

#### Get metadata from hasura cloud

`hasura metadata export --endpoint=https://your-subdomain.hasura.app --admin-secret=your-secret`

### Apply Migrations and Metadata

`hasura migrate apply --database-name default && hasura metadata apply`

### Change Data Source in hasura console
`hasura console` to launch Hasura console, should be running on http://localhost:9695

- Go to **DATA** tab
- Click on **Manage** button on the left column, click **Edit** button and change **Edit Data Source** to the docker image running locally. `postgresql://postgres:postgres@localhost:5432/postgres`

## Data

### Backup data from Hasura Cloud

`pg_dump -h your-host.com -U your-user your-database --data-only > your-file.sql`

### Start Hasura GraphQL Engine

At the root of the project run `docker-compose up -d`.
cd into hasura directory and run `hasura console --admin-secret a-super-secret`, this will open a browser tab.

#### Troubleshooting

If when running command `docker-compose up -d` the container postgresql keeps restarting, run `docker-compose down -v --rmi all` This will remove all volumes (-v) and all the images (--rmi all)

At this point you should redo steps **_Migrations_** and **_Metadata_**

### Restore local database

In order to restore the local database we need to enter the postgresql container. Run `docker ps` to view the running containers

Copy the container id from the image **postgres:14.4**

Copy the `your-file.sql` file into the docker container with `docker cp your-file.sql container_id:/your-file.sql`

Run `docker exec -it container_id bash`

Once inside the docker container run `psql postgres -U postgres < your-file.sql`
