FROM python:3.12-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

WORKDIR /app

COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev

COPY pipeline/ pipeline/
COPY main.py config.py ./
COPY data/pdfs/ data/pdfs/

CMD ["uv", "run", "python", "main.py"]
