"""
Language Intelligence Test Project
===================================
Open this file in Neovim to test every LSP/treesitter/linter/formatter feature.

=== TEST CHECKLIST ===

1. COMPLETION (blink.cmp):
   - Place cursor after "calculator." on any line below, wait 200ms → completion menu
   - Should show: add(), subtract(), multiply(), divide(), last_result
   - Should show documentation popup for each method (auto_show_delay_ms = 200)

2. GO-TO-DEFINITION (gd):
   - Place cursor on "Calculator" (class name) → gd → should jump to models.py line 6
   - Place cursor on "calc.add" (method call) → gd → should jump to models.py add()

3. FIND REFERENCES (gr):
   - Place cursor on "add" in models.py → gr → Telescope lists all call sites in main.py

4. HOVER (K):
   - Place cursor on "add" method call → K → shows function signature + docstring
   - Place cursor on "calc" variable → K → shows "Calculator" type

5. RENAME (<leader>rn):
   - Place cursor on "GREETING" constant → <leader>rn → type new name → all references update
   - Place cursor on "Calculator" class in models.py → rename → updates main.py import too

6. CODE ACTION (<leader>ca):
   - Delete "from models import Calculator" line → cursor on red-squiggled "Calculator" →
     <leader>ca → "Auto-import: from models import Calculator"

7. DIAGNOSTICS (]d / [d):
   - The BAD_VARIABLE line below should show a red squiggle
   - ]d jumps to it
   - There should also be lint warnings from ruff (unused imports, etc.)

8. FORMATTING (<leader>fm):
   - Mess up the indentation on any line → <leader>fm → ruff_format restores 4-space indent

9. TREESITTER:
   - Functions/classes should be foldable (zc to close, zo to open)
   - Indent guides should be visible
   - Syntax highlighting should be accurate (strings one color, keywords another)

10. GITSIGNS:
    - After making changes, gutter shows +/~ markers for added/modified lines
    - ]h / [h navigates between hunks
"""

from models import Calculator, GREETING


def process_data(values):
    calc = Calculator()
    results = []
    for v in values:
        r = calc.add(v, 10)
        results.append(r)
    return results


def main():
    print(GREETING)

    calc = Calculator()
    calc.add(5, 3)
    calc.subtract(10, 4)
    calc.multiply(6, 7)
    result = calc.divide(100, 5)
    print(f"Final division result: {result}")

    data = process_data([1, 2, 3, 4, 5])
    print(f"Processed data: {data}")

    unused_variable = "this should trigger a lint warning"

    return result


if __name__ == "__main__":
    main()
