local map = vim.keymap.set

map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Diagnostic details" })
