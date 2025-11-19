# mitchallen Python Packages

A monorepo containing Python random number generation utilities.

## Packages

### 📦 [mitchallen-coin](packages/mitchallen-coin)

[![PyPI version](https://img.shields.io/pypi/v/mitchallen-coin.svg)](https://pypi.org/project/mitchallen-coin/)
[![Python versions](https://img.shields.io/pypi/pyversions/mitchallen-coin.svg)](https://pypi.org/project/mitchallen-coin/)
[![Downloads](https://img.shields.io/pypi/dm/mitchallen-coin.svg)](https://pypi.org/project/mitchallen-coin/)

A simple coin flip random number generator.

```python
from mitchallen.coin import flip, heads, tails

result = flip()  # Returns True or False with 50% probability
```

**[View Documentation →](packages/mitchallen-coin/README.md)**

### 🎲 [mitchallen-roll](packages/mitchallen-roll)

A dice rolling random number generator.

```python
from mitchallen.roll import roll, d6, d20

result = roll()    # Roll a 6-sided die (returns 1-6)
result = roll(20)  # Roll a 20-sided die (returns 1-20)
result = d6()      # Roll a 6-sided die
result = d20()     # Roll a 20-sided die
```

**[View Documentation →](packages/mitchallen-roll/README.md)**

## Installation

Install packages individually:

```bash
pip install mitchallen-coin
pip install mitchallen-roll
```

Or with uv:

```bash
uv add mitchallen-coin
uv add mitchallen-roll
```

## Development

### Prerequisites

- Python 3.12+
- [uv](https://docs.astral.sh/uv/) package manager

### Setup

```bash
# Clone the repository
git clone https://github.com/mitchallen/python-coin-flip.git
cd python-coin-flip

# Sync dependencies for all packages
make sync-all
```

### Common Commands

```bash
# Run all tests
make test-all

# Lint all packages
make lint-all

# Format all packages
make format-all

# Clean build artifacts
make clean-all
```

### Package-Specific Commands

For `mitchallen-coin`:
```bash
make test-coin        # Run tests
make lint-coin        # Run linters
make build-coin       # Build package
make publish-coin     # Publish to PyPI
```

For `mitchallen-roll`:
```bash
make test-roll        # Run tests
make lint-roll        # Run linters
make build-roll       # Build package
make publish-roll     # Publish to PyPI
```

Run `make help` to see all available commands.

## Repository Structure

```
python-coin-flip/
├── packages/
│   ├── mitchallen-coin/     # Coin flip package
│   │   ├── mitchallen/
│   │   │   └── coin/
│   │   ├── tests/
│   │   ├── pyproject.toml
│   │   └── README.md
│   └── mitchallen-roll/     # Dice roll package
│       ├── mitchallen/
│       │   └── roll/
│       ├── tests/
│       ├── pyproject.toml
│       └── README.md
├── Makefile                 # Monorepo commands
└── README.md                # This file
```

## Publishing

Each package is versioned and published independently:

- **mitchallen-coin**: Uses tags like `v1.0.9`
- **mitchallen-roll**: Uses tags like `roll-v1.0.9`

To publish a package:

```bash
# Publish coin (increments patch version, commits, tags, and publishes)
make publish-coin

# Publish roll (increments patch version, commits, tags, and publishes)
make publish-roll
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines.

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Author

Mitch Allen

## Links

- [PyPI: mitchallen-coin](https://pypi.org/project/mitchallen-coin/)
- [PyPI: mitchallen-roll](https://pypi.org/project/mitchallen-roll/)
- [GitHub Repository](https://github.com/mitchallen/python-coin-flip)
- [Issues](https://github.com/mitchallen/python-coin-flip/issues)
