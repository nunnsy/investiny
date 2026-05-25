.PHONY: quality style types tests build-docs serve-docs

quality:
	uv run --group dev black --check --target-version py39 --preview src/investiny tests
	uv run --group dev isort --check-only src/investiny tests
	uv run --group dev flake8 src/investiny tests

style:
	uv run --group dev black --target-version py39 --preview src/investiny tests
	uv run --group dev isort src/investiny tests

types:
	uv run --group dev mypy src/investiny tests

tests:
	uv run --group dev pytest tests/ --durations 0 -s

build-docs:
	uv run --group dev --extra docs mkdocs build

serve-docs:
	uv run --group dev --extra docs mkdocs serve
