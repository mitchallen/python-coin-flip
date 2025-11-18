"""mitchallen.coin - A simple coin flip random number generator."""

import random

__version__ = "0.1.0"


def flip():
    """
    Return a random decimal number from 0.0 to < 1.0.

    Returns:
        float: A random floating-point number in the range [0.0, 1.0)

    Examples:
        >>> result = flip()
        >>> 0.0 <= result < 1.0
        True
    """
    return random.random()


__all__ = ["flip"]
