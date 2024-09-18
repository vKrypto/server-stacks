# app/main.py

from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI()

Instrumentator().instrument(app).expose(
    app, endpoint="/prometheus/metrics", should_gzip=False
)

@app.get("/")
def read_root():
    return {"ping": "pong!"}
