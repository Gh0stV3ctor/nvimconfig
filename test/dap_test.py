#!/usr/bin/env python3
"""
DAP (Debugger) test -- Python
Usage: Open this file in Neovim, place cursor on the line marked below,
       press <leader>db to set a breakpoint, then <leader>dc to start debugging.
       Step through with <leader>do / <leader>di. Terminate with <leader>dt.
"""


def multiply(a, b):
    result = a * b
    return result


def divide(a, b):
    if b == 0:
        return None
    result = a / b
    return result


def breakpoint_here():
    x = 10
    y = 20
    z = multiply(x, y)  # <-- Set a breakpoint here with <leader>db
    w = divide(z, 5)
    q = divide(z, 0)    # <-- Try stepping into this divide() call with <leader>di
    print(f"x={x}, y={y}, z={z}, w={w}, q={q}")
    return z


if __name__ == "__main__":
    result = breakpoint_here()
    print(f"Final result: {result}")
