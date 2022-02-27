#!/usr/bin/env python3
from psycopg2 import connect
from psycopg2.extensions import parse_dsn
from pq import PQ

conn = connect(
    **parse_dsn("postgresql://postgres:secret@127.0.0.1:5432/postgres")
)
pq = PQ(conn)

pq.create()
queue = pq['queue1']
for job in queue:
    if job is not None:
        print(job)
        print(job.data)
