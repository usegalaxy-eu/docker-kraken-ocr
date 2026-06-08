# syntax=docker/dockerfile:1
ARG UV_VERSION=0.11.18
ARG PYTHON_VERSION=3.13.13

FROM ghcr.io/astral-sh/uv:${UV_VERSION} AS uv

FROM python:${PYTHON_VERSION}-slim-bookworm

COPY --from=uv /uv /uvx /usr/local/bin/

ENV UV_SYSTEM_PYTHON=1 \
    UV_NO_CACHE=1 \
    UV_HTTP_TIMEOUT=300 

RUN python -m pip install uv

RUN uv pip install kraken[pdf]

WORKDIR /work
CMD [""]