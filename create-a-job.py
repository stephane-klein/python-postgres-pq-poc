#!/usr/bin/env python3
from psycopg2 import connect
from psycopg2.extensions import parse_dsn
from pq import PQ

conn = connect(
    **parse_dsn("postgresql://postgres:secret@127.0.0.1:5432/postgres")
)
pq = PQ(conn)

queue = pq['queue1']
with queue as cursor:
    queue.put({"foo": "bar"})
