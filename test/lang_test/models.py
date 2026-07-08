"""Models for the language intelligence test project."""

GREETING = "Hello from the test project!"
PI = 3.14159


class Calculator:
    """A simple calculator with basic arithmetic operations.

    Test gd (go-to-definition) here: place cursor on "Calculator" in main.py,
    press gd, and Neovim should jump to this line.
    """

    def __init__(self):
        self.last_result = 0
        self.history = []

    def add(self, a: int, b: int) -> int:
        """Add two integers and return the result.

        Args:
            a: First operand
            b: Second operand
        """
        result = a + b
        self.last_result = result
        self.history.append(("add", a, b, result))
        return result

    def subtract(self, a: int, b: int) -> int:
        """Subtract b from a."""
        result = a - b
        self.last_result = result
        self.history.append(("subtract", a, b, result))
        return result

    def multiply(self, a: int, b: int) -> int:
        """Multiply two integers."""
        result = a * b
        self.last_result = result
        self.history.append(("multiply", a, b, result))
        return result

    def divide(self, a: int, b: int) -> float:
        """Divide a by b. Returns 0 if b is zero."""
        if b == 0:
            return 0.0
        result = a / b
        self.last_result = result
        self.history.append(("divide", a, b, result))
        return result

    def get_last_result(self) -> int:
        """Return the result of the last operation."""
        return self.last_result

    def clear_history(self):
        """Clear the operation history."""
        self.history.clear()
