# mitchallen.coin

[![PyPI version](https://img.shields.io/pypi/v/mitchallen-coin.svg)](https://pypi.org/project/mitchallen-coin/)
[![Python versions](https://img.shields.io/pypi/pyversions/mitchallen-coin.svg)](https://pypi.org/project/mitchallen-coin/)
[![License](https://img.shields.io/pypi/l/mitchallen-coin.svg)](https://github.com/mitchallen/python-coin-flip/blob/main/LICENSE)
[![Downloads](https://img.shields.io/pypi/dm/mitchallen-coin.svg)](https://pypi.org/project/mitchallen-coin/)

A simple, lightweight Python package that provides a random number generator perfect for simulations, games, and probabilistic applications.

## Installation

```bash
pip install mitchallen-coin
```

## Quick Start

```python
from mitchallen.coin import flip

# Get a random number between 0.0 and 1.0
result = flip()
print(result)  # e.g., 0.7234567890123456
```

## Usage Examples

### Simulate a Coin Flip

```python
from mitchallen.coin import flip

if flip() < 0.5:
    print("Heads")
else:
    print("Tails")
```

### Random Probability Events

```python
from mitchallen.coin import flip

# 30% chance of rain
if flip() < 0.3:
    print("Bring an umbrella!")
else:
    print("No rain expected")
```

### Monte Carlo Simulation

```python
from mitchallen.coin import flip

# Estimate pi using Monte Carlo method
inside_circle = 0
total_points = 100000

for _ in range(total_points):
    x = flip()
    y = flip()
    if x*x + y*y <= 1:
        inside_circle += 1

pi_estimate = 4 * inside_circle / total_points
print(f"Pi estimate: {pi_estimate}")
```

### Random Selection with Weighted Probabilities

```python
from mitchallen.coin import flip

def choose_outcome(probabilities):
    """Choose an outcome based on probability distribution."""
    value = flip()
    cumulative = 0
    for outcome, prob in probabilities.items():
        cumulative += prob
        if value < cumulative:
            return outcome
    return list(probabilities.keys())[-1]

# Game loot drop system
loot = {
    "common": 0.5,
    "rare": 0.3,
    "epic": 0.15,
    "legendary": 0.05
}

result = choose_outcome(loot)
print(f"You got: {result}")
```

## API Reference

### `flip()`

Returns a random floating-point number in the range [0.0, 1.0).

**Returns:**
- `float`: A random decimal number from 0.0 (inclusive) to 1.0 (exclusive)

**Example:**

```python
from mitchallen.coin import flip

value = flip()
assert 0.0 <= value < 1.0
```

## Why mitchallen.coin?

- **Simple**: One function, does one thing well
- **Lightweight**: No dependencies
- **Tested**: Comprehensive test suite ensuring quality and reliability
- **Namespace package**: Works alongside other mitchallen packages

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for development setup and guidelines.

## License

MIT License - see [LICENSE](LICENSE) for details.
