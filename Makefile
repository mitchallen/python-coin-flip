.PHONY: help install test test-verbose clean build publish-test publish sync

help:
	@echo "Available commands:"
	@echo "  make install       - Install package in development mode"
	@echo "  make sync          - Sync dependencies with uv"
	@echo "  make test          - Run tests with pytest"
	@echo "  make test-verbose  - Run tests with verbose output"
	@echo "  make clean         - Remove build artifacts and cache files"
	@echo "  make build         - Build the package"
	@echo "  make publish-test  - Publish to TestPyPI"
	@echo "  make publish       - Publish to PyPI"

install:
	uv pip install -e .

sync:
	uv sync

test:
	uv run pytest

test-verbose:
	uv run pytest -v

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf .pytest_cache/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name '*.pyc' -delete
	find . -type f -name '*.pyo' -delete

build: clean
	uv build

publish-test: build
	uv publish --publish-url https://test.pypi.org/legacy/

publish: build
	uv publish
