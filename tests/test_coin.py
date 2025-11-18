"""Test cases for the mitchallen.coin.flip function."""

import pytest
from mitchallen.coin import flip


class TestFlip:
    """Test cases for the flip() function."""

    def test_flip_returns_float(self):
        """Test that flip() returns a float."""
        result = flip()
        assert isinstance(result, float)

    def test_flip_in_range(self):
        """Test that flip() returns a value in [0.0, 1.0)."""
        result = flip()
        assert 0.0 <= result < 1.0

    def test_flip_multiple_calls_in_range(self):
        """Test that multiple calls to flip() all return values in range."""
        for _ in range(100):
            result = flip()
            assert 0.0 <= result < 1.0
            assert isinstance(result, float)

    def test_flip_returns_different_values(self):
        """Test that flip() returns different values (not always the same)."""
        results = [flip() for _ in range(100)]
        # It's extremely unlikely all 100 values are identical
        assert len(set(results)) > 1

    def test_flip_never_returns_one(self):
        """Test that flip() never returns exactly 1.0."""
        for _ in range(1000):
            result = flip()
            assert result != 1.0

    def test_flip_can_return_zero(self):
        """Test that flip() can theoretically return 0.0 (lower bound inclusive)."""
        # This test verifies the lower bound is inclusive by checking many values
        # While we can't guarantee we'll get exactly 0.0, we can verify very small values
        results = [flip() for _ in range(1000)]
        assert any(result < 0.1 for result in results), "Should get some values near 0"

    def test_flip_distribution(self):
        """Test that flip() has roughly uniform distribution."""
        num_samples = 10000
        results = [flip() for _ in range(num_samples)]

        # Count values in lower half [0, 0.5) and upper half [0.5, 1.0)
        lower_half = sum(1 for r in results if r < 0.5)
        upper_half = sum(1 for r in results if r >= 0.5)

        # With uniform distribution, expect roughly 50/50 split
        # Allow 5% tolerance (should be within 45-55% for each half)
        lower_ratio = lower_half / num_samples
        upper_ratio = upper_half / num_samples

        assert 0.45 <= lower_ratio <= 0.55, f"Lower half ratio {lower_ratio} outside expected range"
        assert 0.45 <= upper_ratio <= 0.55, f"Upper half ratio {upper_ratio} outside expected range"
