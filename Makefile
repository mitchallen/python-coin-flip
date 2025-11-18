.PHONY: help install test test-verbose lint format lint-fix clean build publish-test publish sync bump-patch bump-minor bump-major

help:
	@echo "Available commands:"
	@echo "  make install       - Install package in development mode"
	@echo "  make sync          - Sync dependencies with uv"
	@echo "  make test          - Run tests with pytest"
	@echo "  make test-verbose  - Run tests with verbose output"
	@echo "  make lint          - Run all linters (ruff + mypy)"
	@echo "  make format        - Auto-format code with ruff"
	@echo "  make lint-fix      - Auto-fix linting issues with ruff"
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

lint:
	@echo "Running ruff check..."
	uv run ruff check .
	@echo "Running ruff format check..."
	uv run ruff format --check .
	@echo "Running mypy..."
	uv run mypy mitchallen tests

format:
	@echo "Formatting code with ruff..."
	uv run ruff format .

lint-fix:
	@echo "Auto-fixing linting issues..."
	uv run ruff check --fix .
	uv run ruff format .

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
	uv version --bump patch

bump-minor:
	@echo "Bumping minor version..."
	uv version --bump minor

bump-major:
	@echo "Bumping major version..."
	uv version --bump major

build: clean
	uv build

publish-test: build
	uv publish --publish-url https://test.pypi.org/legacy/

publish:
	@echo "Switching to main branch..."
	git checkout main
	@echo "Pulling latest changes..."
	git pull
	@echo "Incrementing patch version..."
	uv version --bump patch
	@echo "Getting new version..."
	@NEW_VERSION=$$(uv version | awk '{print $$2}'); \
	echo "Committing version bump to $$NEW_VERSION..."; \
	git add pyproject.toml uv.lock; \
	git commit -m "Bump version to $$NEW_VERSION"; \
	echo "Creating git tag..."; \
	git tag "v$$NEW_VERSION"; \
	echo "Pushing changes and tags..."; \
	git push && git push --tags; \
	echo "Creating GitHub release (this will trigger PyPI publish)..."; \
	gh release create "v$$NEW_VERSION" --title "v$$NEW_VERSION" --generate-notes
