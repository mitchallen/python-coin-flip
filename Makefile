.PHONY: help install-all sync-all test-all lint-all format-all clean-all
.PHONY: install-coin sync-coin test-coin lint-coin build-coin publish-coin publish-test-coin
.PHONY: install-roll sync-roll test-roll lint-roll build-roll publish-roll publish-test-roll

# Package directories
COIN_DIR = packages/mitchallen-coin
ROLL_DIR = packages/mitchallen-roll

help:
	@echo "Monorepo commands (all packages):"
	@echo "  make install-all       - Install all packages in development mode"
	@echo "  make sync-all          - Sync dependencies for all packages"
	@echo "  make test-all          - Run tests for all packages"
	@echo "  make lint-all          - Run linters for all packages"
	@echo "  make format-all        - Format code for all packages"
	@echo "  make clean-all         - Clean build artifacts for all packages"
	@echo ""
	@echo "mitchallen-coin commands:"
	@echo "  make install-coin      - Install coin package in development mode"
	@echo "  make sync-coin         - Sync coin dependencies"
	@echo "  make test-coin         - Run coin tests"
	@echo "  make lint-coin         - Run coin linters"
	@echo "  make build-coin        - Build coin package"
	@echo "  make publish-coin      - Publish coin to PyPI"
	@echo "  make publish-test-coin - Publish coin to TestPyPI"
	@echo ""
	@echo "mitchallen-roll commands:"
	@echo "  make install-roll      - Install roll package in development mode"
	@echo "  make sync-roll         - Sync roll dependencies"
	@echo "  make test-roll         - Run roll tests"
	@echo "  make lint-roll         - Run roll linters"
	@echo "  make build-roll        - Build roll package"
	@echo "  make publish-roll      - Publish roll to PyPI"
	@echo "  make publish-test-roll - Publish roll to TestPyPI"

# All packages commands
install-all: install-coin install-roll

sync-all: sync-coin sync-roll

test-all: test-coin test-roll

lint-all: lint-coin lint-roll

format-all: format-coin format-roll

clean-all: clean-coin clean-roll

# mitchallen-coin commands
install-coin:
	cd $(COIN_DIR) && uv pip install -e .

sync-coin:
	cd $(COIN_DIR) && uv sync

test-coin:
	cd $(COIN_DIR) && uv run pytest

test-coin-verbose:
	cd $(COIN_DIR) && uv run pytest -v

lint-coin:
	@echo "Running ruff check on coin..."
	cd $(COIN_DIR) && uv run ruff check .
	@echo "Running ruff format check on coin..."
	cd $(COIN_DIR) && uv run ruff format --check .
	@echo "Running mypy on coin..."
	cd $(COIN_DIR) && uv run mypy mitchallen tests

format-coin:
	@echo "Formatting coin code with ruff..."
	cd $(COIN_DIR) && uv run ruff format .

lint-fix-coin:
	@echo "Auto-fixing coin linting issues..."
	cd $(COIN_DIR) && uv run ruff check --fix .
	cd $(COIN_DIR) && uv run ruff format .

vuln-test-coin:
	@echo "Running vulnerability scan on coin..."
	cd $(COIN_DIR) && uv run pip-audit

clean-coin:
	cd $(COIN_DIR) && rm -rf build/ dist/ *.egg-info .pytest_cache/
	find $(COIN_DIR) -type d -name __pycache__ -exec rm -rf {} +
	find $(COIN_DIR) -type f -name '*.pyc' -delete

build-coin: clean-coin
	cd $(COIN_DIR) && uv build

publish-test-coin: build-coin
	cd $(COIN_DIR) && uv publish --publish-url https://test.pypi.org/legacy/

publish-coin: lint-coin test-coin vuln-test-coin
	@echo "Publishing mitchallen-coin..."
	@echo "Switching to main branch..."
	git checkout main
	@echo "Pulling latest changes..."
	git pull
	@echo "Incrementing patch version..."
	cd $(COIN_DIR) && uv version --bump patch
	@echo "Getting new version..."
	@NEW_VERSION=$$(cd $(COIN_DIR) && uv version | awk '{print $$2}'); \
	echo "Committing version bump to $$NEW_VERSION..."; \
	git add $(COIN_DIR)/pyproject.toml; \
	git commit -m "Bump mitchallen-coin to $$NEW_VERSION"; \
	echo "Creating git tag coin-v$$NEW_VERSION..."; \
	git tag "coin-v$$NEW_VERSION"; \
	echo "Pushing changes and tags..."; \
	git push && git push --tags; \
	echo "Creating GitHub release (will trigger workflow to build and publish)..."; \
	gh release create "coin-v$$NEW_VERSION" --title "mitchallen-coin v$$NEW_VERSION" --generate-notes

# mitchallen-roll commands
install-roll:
	cd $(ROLL_DIR) && uv pip install -e .

sync-roll:
	cd $(ROLL_DIR) && uv sync

test-roll:
	cd $(ROLL_DIR) && uv run pytest

test-roll-verbose:
	cd $(ROLL_DIR) && uv run pytest -v

lint-roll:
	@echo "Running ruff check on roll..."
	cd $(ROLL_DIR) && uv run ruff check .
	@echo "Running ruff format check on roll..."
	cd $(ROLL_DIR) && uv run ruff format --check .
	@echo "Running mypy on roll..."
	cd $(ROLL_DIR) && uv run mypy mitchallen tests

format-roll:
	@echo "Formatting roll code with ruff..."
	cd $(ROLL_DIR) && uv run ruff format .

lint-fix-roll:
	@echo "Auto-fixing roll linting issues..."
	cd $(ROLL_DIR) && uv run ruff check --fix .
	cd $(ROLL_DIR) && uv run ruff format .

vuln-test-roll:
	@echo "Running vulnerability scan on roll..."
	cd $(ROLL_DIR) && uv run pip-audit

clean-roll:
	cd $(ROLL_DIR) && rm -rf build/ dist/ *.egg-info .pytest_cache/
	find $(ROLL_DIR) -type d -name __pycache__ -exec rm -rf {} +
	find $(ROLL_DIR) -type f -name '*.pyc' -delete

build-roll: clean-roll
	cd $(ROLL_DIR) && uv build

publish-test-roll: build-roll
	cd $(ROLL_DIR) && uv publish --publish-url https://test.pypi.org/legacy/

publish-roll: lint-roll test-roll vuln-test-roll
	@echo "Publishing mitchallen-roll..."
	@echo "Switching to main branch..."
	git checkout main
	@echo "Pulling latest changes..."
	git pull
	@echo "Incrementing patch version..."
	cd $(ROLL_DIR) && uv version --bump patch
	@echo "Getting new version..."
	@NEW_VERSION=$$(cd $(ROLL_DIR) && uv version | awk '{print $$2}'); \
	echo "Committing version bump to $$NEW_VERSION..."; \
	git add $(ROLL_DIR)/pyproject.toml; \
	git commit -m "Bump mitchallen-roll to $$NEW_VERSION"; \
	echo "Creating git tag roll-v$$NEW_VERSION..."; \
	git tag "roll-v$$NEW_VERSION"; \
	echo "Pushing changes and tags..."; \
	git push && git push --tags; \
	echo "Creating GitHub release (will trigger workflow to build and publish)..."; \
	gh release create "roll-v$$NEW_VERSION" --title "mitchallen-roll v$$NEW_VERSION" --generate-notes
