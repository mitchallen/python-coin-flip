# Contributing to mitchallen.coin

Thank you for your interest in contributing to this project!

## Development Setup

This package uses `uv` for dependency management and packaging.

### Prerequisites

- Python 3.12 or higher
- [uv](https://github.com/astral-sh/uv) package manager

### Setup Instructions

1. Clone the repository:
```bash
git clone https://github.com/mitchallen/python-coin-flip.git
cd python-coin-flip
```

2. Install dependencies:
```bash
make sync
```

Or manually:
```bash
uv sync
```

3. Install the package in development mode:
```bash
make install
```

## Running Tests

The package includes a comprehensive test suite with pytest.

```bash
make test          # Run tests
make test-verbose  # Run tests with verbose output
```

Or manually:
```bash
uv run pytest
uv run pytest -v
```

## Code Quality

The project uses modern linting and formatting tools to maintain code quality:

- **Ruff**: Fast Python linter and formatter (replaces black, flake8, isort, and more)
- **Mypy**: Static type checker for Python

### Running Linters

```bash
make lint          # Run all linters (ruff + mypy)
make format        # Auto-format code with ruff
make lint-fix      # Auto-fix linting issues and format code
```

Or manually:
```bash
uv run ruff check .
uv run ruff format .
uv run mypy mitchallen tests
```

All linting checks must pass before submitting a pull request.

## Available Make Commands

- `make help` - Show all available commands
- `make install` - Install package in development mode
- `make sync` - Sync dependencies with uv
- `make test` - Run tests with pytest
- `make test-verbose` - Run tests with verbose output
- `make lint` - Run all linters (ruff + mypy)
- `make format` - Auto-format code with ruff
- `make lint-fix` - Auto-fix linting issues with ruff
- `make clean` - Remove build artifacts and cache files
- `make build` - Build the package distribution files
- `make bump-patch` - Bump patch version (0.1.0 -> 0.1.1)
- `make bump-minor` - Bump minor version (0.1.0 -> 0.2.0)
- `make bump-major` - Bump major version (0.1.0 -> 1.0.0)
- `make publish-test` - Publish to TestPyPI
- `make publish` - Bump patch version, create GitHub release (triggers PyPI publish)

## Building

```bash
make build
```

Or manually:
```bash
uv build
```

## Testing

The package includes comprehensive test cases that verify:
- Return type validation (boolean)
- Boolean value validation (True/False)
- Randomness and distribution
- Statistical properties

All tests must pass before submitting a pull request.

## Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests and linters to ensure everything passes:
   ```bash
   make test
   make lint
   ```
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Code Style

The project enforces code quality through automated linting:

- **Formatting**: Code is automatically formatted with Ruff (100 character line length)
- **Linting**: Ruff checks for common errors, code smells, and style issues
- **Type Checking**: Mypy ensures proper type annotations in the library code
- **Standards**: Follows PEP 8 guidelines
- **Documentation**: Include docstrings with type information for all functions
- **Testing**: Add tests for new functionality

Run `make lint-fix` to automatically fix most formatting and linting issues.

## Questions?

Open an issue on [GitHub](https://github.com/mitchallen/python-coin-flip/issues) if you have questions or need help.
