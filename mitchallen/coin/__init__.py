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


def heads():
    """
    Return True if flip() > 0.5, False otherwise.

    Returns:
        bool: True if the coin flip result is greater than 0.5, False otherwise

    Examples:
        >>> result = heads()
        >>> isinstance(result, bool)
        True
    """
    return flip() > 0.5


def tails():
    """
    Return the opposite boolean value of heads().

    Returns:
        bool: True if heads() would return False, False if heads() would return True

    Examples:
        >>> result = tails()
        >>> isinstance(result, bool)
        True
    """
    return not heads()


__all__ = ["flip", "heads", "tails"]
