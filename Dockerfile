FROM python:3.9-slim

RUN apt-get update \
    && apt-get install build-essential git -y --no-install-recommends

ENV PYTHONUNBUFFERED=1

RUN python -m pip install pip --upgrade \
    && python -m pip install uv

COPY . .

RUN uv sync --group dev --extra docs