# Neovim Test Suite

Files to verify that all language intelligence features are working.

## DAP Debugging — `test/dap_test.py`

1. Open `test/dap_test.py`
2. Place cursor on `z = multiply(x, y)  -- Set a breakpoint on this line with <leader>db`
3. `<leader>db` → red dot appears in gutter
4. `<leader>dc` → debug session starts → panel opens automatically
5. `<leader>do` → step over (execute current line)
6. `<leader>di` → step into the `multiply()` function
7. `<leader>dO` → step out back to `breakpoint_here()`
8. Variables panel shows x, y, z, w values updating each step
9. `<leader>dt` → terminate

## Language Intelligence — `test/lang_test/`

Project structure:
```
lang_test/
├── models.py          — Calculator class with full docstrings
├── main.py            — imports Calculator, exercises all methods
├── tests/
│   └── test_calc.py   — unit tests (for gr: find references)
└── pyproject.toml     — ruff linter config
```

| Feature | What to test | File | Steps |
|---------|-------------|------|-------|
| Completion | blink.cmp shows Calculator methods | main.py | Type `calc.` → menu pops up with add/subtract/multiply/divide |
| Go-to-definition | `gd` jumps to class/method | main.py | Cursor on `Calculator` → `gd` → jumps to models.py line 6 |
| Find references | `gr` lists all call sites | models.py | Cursor on `add` def → `gr` → lists all `calc.add(...)` in main.py + test_calc.py |
| Hover | `K` shows docstring | main.py | Cursor on `calc.add` → `K` → shows "Add two integers and return the result" |
| Rename | `<leader>rn` renames symbol project-wide | models.py | Cursor on `GREETING` → `<leader>rn` → type `WELCOME` → all files update |
| Code action | `<leader>ca` auto-imports | main.py | Delete `from models import Calculator` → cursor on red-squiggled `Calculator` → `<leader>ca` → "Add import" |
| Diagnostics | `]d`/`[d` navigate errors | main.py | `]d` jumps between ruff lint warnings (unused_variable, etc.) |
| Formatting | `<leader>fm` formats with ruff | any .py | Mess up indentation → `<leader>fm` → restores PEP 8 4-space indent |
| Treesitter folding | `zc`/`zo` fold functions | models.py | Cursor inside `add()` → `zc` → function collapses to one line |
| Treesitter highlight | Accurate syntax colors | any .py | Strings one color, `def`/`class` another, variables another |
| Gitsigns | `]h`/`[h` navigate hunks | any file | Modify a line → gutter shows `~` → `]h` jumps to next changed hunk |
