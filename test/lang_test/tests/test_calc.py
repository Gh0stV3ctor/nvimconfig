"""Tests for Calculator — used to test 'gr' (find references) and 'gi' (go to implementation)."""

from models import Calculator


def test_add():
    calc = Calculator()
    result = calc.add(5, 3)
    assert result == 8
    assert calc.last_result == 8


def test_subtract():
    calc = Calculator()
    result = calc.subtract(10, 4)
    assert result == 6


def test_multiply():
    calc = Calculator()
    result = calc.multiply(6, 7)
    assert result == 42


def test_divide():
    calc = Calculator()
    result = calc.divide(100, 5)
    assert result == 20.0


def test_divide_by_zero():
    calc = Calculator()
    result = calc.divide(42, 0)
    assert result == 0.0
