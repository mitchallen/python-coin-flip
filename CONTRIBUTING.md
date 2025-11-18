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

## Available Make Commands

- `make help` - Show all available commands
- `make install` - Install package in development mode
- `make sync` - Sync dependencies with uv
- `make test` - Run tests with pytest
- `make test-verbose` - Run tests with verbose output
- `make clean` - Remove build artifacts and cache files
- `make build` - Build the package distribution files
- `make publish-test` - Publish to TestPyPI
- `make publish` - Publish to PyPI

## Building

```bash
make build
```

Or manually:
```bash
uv build
```

## Testing

The package includes 7 comprehensive test cases that verify:
- Return type validation
- Range validation [0.0, 1.0)
- Randomness and distribution
- Statistical properties

All tests must pass before submitting a pull request.

## Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests to ensure everything passes
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Code Style

- Follow PEP 8 guidelines
- Include docstrings for all functions
- Add tests for new functionality

## Questions?

Open an issue on [GitHub](https://github.com/mitchallen/python-coin-flip/issues) if you have questions or need help.
