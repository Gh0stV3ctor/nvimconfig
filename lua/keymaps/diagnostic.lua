local map = vim.keymap.set

-- Neovim 0.12 API: vim.diagnostic.jump() replaces the deprecated goto_next / goto_prev
map('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Next diagnostic' })
map('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Previous diagnostic' })
map('n', '<leader>de', function() vim.diagnostic.open_float({ scope = 'line' }) end, { desc = 'Diagnostic details' })


map("n", "<leader>tr", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
