# Python Postgres pq POC

I created this project to test how the [pq](https://github.com/malthe/pq/) (Simple transactional queue for PostgreSQL
written in Python) library works and how I can create jobs directly from sql queries and not only via Python.

## Prerequisites

- Docker
- Python 3
- Poetry:

```sh
$ pip install poetry
```

## Getting started

```sh
$ poetry install
```

```sh
$ docker-compose up -d
```

In a first terminal, start:

```sh
$ poetry run ./server.py
```

In a second terminal, start another server:

```sh
$ poetry run ./server.py
```

In a third terminal, create a job:

```
$ poetry run ./create-a-job.py
```

You can also create a job via PostreSQL console:

```
$ ./scripts/enter-in-pg.sh
postgres=# INSERT INTO queue (q_name, data) VALUES('apples', '{"foo": "bar2"}');
INSERT 0 1
postgres=#
```

