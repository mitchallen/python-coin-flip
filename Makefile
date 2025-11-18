.PHONY: help install test test-verbose clean build publish-test publish sync bump-patch bump-minor bump-major

help:
	@echo "Available commands:"
	@echo "  make install       - Install package in development mode"
	@echo "  make sync          - Sync dependencies with uv"
	@echo "  make test          - Run tests with pytest"
	@echo "  make test-verbose  - Run tests with verbose output"
	@echo "  make clean         - Remove build artifacts and cache files"
	@echo "  make build         - Build the package"
	@echo "  make bump-patch    - Bump patch version (0.1.0 -> 0.1.1)"
	@echo "  make bump-minor    - Bump minor version (0.1.0 -> 0.2.0)"
	@echo "  make bump-major    - Bump major version (0.1.0 -> 1.0.0)"
	@echo "  make publish-test  - Publish to TestPyPI"
	@echo "  make publish       - Bump patch, build, publish to PyPI, and push"

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

bump-patch:
	@echo "Bumping patch version..."
	uv version patch

bump-minor:
	@echo "Bumping minor version..."
	uv version minor

bump-major:
	@echo "Bumping major version..."
	uv version major

build: clean
	uv build

publish-test: build
	uv publish --publish-url https://test.pypi.org/legacy/

publish:
	@echo "Switching to main branch..."
	git checkout main
	@echo "Incrementing patch version..."
	uv version patch
	@echo "Building package..."
	$(MAKE) build
	@echo "Publishing to PyPI..."
	uv publish
	@echo "Pushing changes and tags..."
	git push && git push --tags
