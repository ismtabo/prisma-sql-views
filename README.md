# Using prisma with MySQL Views

This repository contains an example of Prisma client using MySQL Views, 
following Prisma's [SQL Views](https://www.prisma.io/docs/guides/database/advanced-database-tasks/sql-views-mysql)
guide.

## Requirements

To work with this repository you need to have the following software installed in your computer:
- Node/NPM (v14+)
- Docker
- Docker Compose

## How to

As said before, this repository contains an example on how to use MySQL Views with Prisma client in node-js.
Firstly, you should up a MySQL database. To simplify this process, this repository contains a `docker-compose`
file to contains all services requirements. Run the following command to up the MySQL database:

```sh
docker-compose up -d
```

Secondly, create a `.env` environment configuration file with the following content:

```sh
# Environment variables declared in this file are automatically made available to Prisma.
# See the documentation for more detail: https://pris.ly/d/prisma-schema#using-environment-variables

# Prisma supports the native connection string format for PostgreSQL, MySQL, SQLite, SQL Server and MongoDB (Preview).
# See the documentation for all the connection string options: https://pris.ly/d/connection-strings

DATABASE_URL="mysql://root:toor@localhost:3306/SqlViews"
```

This file is required by Prisma and contains the database url for Prisma connections.

Later, run `npm install` to download all node depencencies. And then, run the following command to apply 
the [migration scripts](./prisma/migrations) in the database:

```sh
npx prisma migrate reset
```

Finally, the file [`./index.ts`](./index.ts) contains the main script of the example. It creates some User and Post entities, 
and then it queries them using the Draft view model. To run the script execute the command bellow:

```sh
npm run dev
```

You should see an output as bellow with all the "draft" (not published) posts:

```js
[
  {
    title: 'My first post',
    id: 4,
    email: 'emily@prisma.io',
    published: false
  },
  {
    title: 'Prisma Day 2020',
    id: 6,
    email: 'emily@prisma.io',
    published: false
  },
  {
    title: 'My first post',
    id: 1,
    email: 'sarah@prisma.io',
    published: false
  },
  {
    title: 'Prisma Day 2020',
    id: 3,
    email: 'sarah@prisma.io',
    published: false
  }
]
[
  {
    title: 'My first post',
    id: 1,
    email: 'sarah@prisma.io',
    published: false
  },
  {
    title: 'Prisma Day 2020',
    id: 3,
    email: 'sarah@prisma.io',
    published: false
  }
]
```

## Author

- Ismael Taboada: [@ismtabo](https://github.com/ismtabo)
