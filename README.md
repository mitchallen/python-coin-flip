# mitchallen.coin

A simple Python package that provides a coin flip random number generator.

## Installation

```bash
uv pip install mitchallen-coin
```

Or with pip:

```bash
pip install mitchallen-coin
```

## Usage

The package provides a single function `flip()` that returns a random decimal number from 0.0 to < 1.0.

```python
from mitchallen.coin import flip

# Get a random number between 0.0 and 1.0
result = flip()
print(result)  # e.g., 0.7234567890123456
```

## API

### `flip()`

Returns a random floating-point number in the range [0.0, 1.0).

**Returns:**
- `float`: A random decimal number from 0.0 (inclusive) to 1.0 (exclusive)

**Example:**

```python
from mitchallen.coin import flip

# Simulate a coin flip
if flip() < 0.5:
    print("Heads")
else:
    print("Tails")
```

## Development

This package uses `uv` for dependency management and packaging.

### Setup

1. Install dependencies:
```bash
make sync
```

Or manually:
```bash
uv sync
```

2. Install the package in development mode:
```bash
make install
```

### Running Tests

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

### Available Make Commands

- `make help` - Show all available commands
- `make install` - Install package in development mode
- `make sync` - Sync dependencies with uv
- `make test` - Run tests with pytest
- `make test-verbose` - Run tests with verbose output
- `make clean` - Remove build artifacts and cache files
- `make build` - Build the package distribution files
- `make publish-test` - Publish to TestPyPI
- `make publish` - Publish to PyPI

### Building

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

## License

MIT
