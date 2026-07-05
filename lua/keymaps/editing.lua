-- =============================================================================
-- editing.lua — Global editing keymaps
-- All keymaps are always available, no plugin dependencies
-- =============================================================================

local map = vim.keymap.set

-- =============================================================================
-- Exit insert mode
-- =============================================================================
-- jk is faster than reaching for Escape or Ctrl+[
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- =============================================================================
-- Save / Quit
-- =============================================================================
map("n", "<leader>ww", "<cmd>ww<CR>", { desc = "Save" })
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit window" })
map("n", "<leader>qq", "<cmd>q!<CR>", { desc = "Quit without save" })
map("n", "<leader>qa", "<cmd>qa!<CR>", { desc = "Quit all window without save" })
-- Force-save: skip all BufWritePre autocmds (bypass format-on-save)
-- map("n", "<leader>W", "<cmd>noautocmd w<CR>", { desc = "Force-save (skip autocmds)" })

-- -- =============================================================================
-- -- Cursor movement: visual line (soft-wrap friendly)
-- -- =============================================================================
-- -- Native j/k moves by real lines. With wrap enabled, gj/gk moves by screen lines.
-- -- When no count prefix (just j), use gj (visual line).
-- -- When count prefix (5j), use native j (precise line number).
-- map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down" })
-- map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up" })
-- map("x", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down" })
-- map("x", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up" })

-- -- =============================================================================
-- -- Scrolling (center after scroll)
-- -- =============================================================================
-- map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half-page" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half-page" })
-- map("n", "<C-f>", "<C-f>zz", { desc = "Scroll down full-page" })
-- map("n", "<C-b>", "<C-b>zz", { desc = "Scroll up full-page" })
-- map("n", "n", "nzzzv", { desc = "Next search result" })
-- map("n", "N", "Nzzzv", { desc = "Previous search result" })
-- -- zz = center cursor, zv = open fold to reveal match

-- -- =============================================================================
-- -- Search
-- -- =============================================================================
-- map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
-- map("v", "*", "y/<C-r>\"<CR>", { desc = "Search forward (selection)" })
-- map("v", "#", "y?<C-r>\"<CR>", { desc = "Search backward (selection)" })
-- -- y = yank selection to "" → / or ? enters search → <C-r>" pastes "" → CR

-- -- =============================================================================
-- -- Deletion (blackhole — don't pollute the unnamed register)
-- -- =============================================================================
-- -- Default x/X overwrites "". After yy then dd, p pastes the deleted line, not yank.
-- -- Use "_ blackhole register: delete silently, "" stays untouched.
-- map("n", "x", '"_x', { desc = "Delete char (blackhole)" })
-- map("n", "X", '"_X', { desc = "Backspace (blackhole)" })
-- map("v", "x", '"_x', { desc = "Delete selection (blackhole)" })

-- =============================================================================
-- Visual paste without overwriting register
-- =============================================================================
map("v", "p", '"_dP', { desc = "Paste (keep register)" })
-- "_d = delete selection into blackhole → P = paste. "" remains intact.

-- =============================================================================
-- Line operations
-- =============================================================================
-- Move selected lines up/down in visual mode
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- Breakdown: :m '>+1 = move last line of selection past itself
--            gv = reselect → = = reindent → gv = reselect again

-- Indent while keeping selection
map("v", "<", "<gv", { desc = "Decrease indent" })
map("v", ">", ">gv", { desc = "Increase indent" })

-- =============================================================================
-- Window management
-- =============================================================================
-- Ctrl+hjkl to navigate splits (consistent with tmux/zellij conventions)
map({ 'n', 't' }, '<A-h>', '<C-\\><C-n><C-w>h', { desc = "Go to left window" })
map({ 'n', 't' }, '<A-j>', '<C-\\><C-n><C-w>j', { desc = "Go to lower window" })
map({ 'n', 't' }, '<A-k>', '<C-\\><C-n><C-w>k', { desc = "Go to upper window" })
map({ 'n', 't' }, '<A-l>', '<C-\\><C-n><C-w>l', { desc = "Go to right window" })

map("n", "<leader>wv", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>wh", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>wd", "<C-w>c", { desc = "Close window" })
map("n", "<leader>wo", "<C-w>o", { desc = "Only window" })
-- Resize windows
map("n", "<C-S-h>", "<cmd>vertical resize -3<CR>", { desc = "Narrower" })
map("n", "<C-S-l>", "<cmd>vertical resize +3<CR>", { desc = "Wider" })
map("n", "<C-S-k>", "<cmd>resize +3<CR>", { desc = "Taller" })
map("n", "<C-S-j>", "<cmd>resize -3<CR>", { desc = "Shorter" })

-- =============================================================================
-- Tab management (easier than native gt/gT)
-- =============================================================================
map("n", "<S-h>", "<cmd>tabp<CR>", { desc = "Previous tab" })
map("n", "<S-l>", "<cmd>tabn<CR>", { desc = "Next tab" })
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
map("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tH", "<cmd>-tabm<CR>", { desc = "Move tab left" })
map("n", "<leader>tL", "<cmd>+tabm<CR>", { desc = "Move tab right" })

-- =============================================================================
-- Buffer management
-- =============================================================================
map("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", function()
  local bufnr = vim.api.nvim_get_current_buf()
  -- 先切到 alternate buffer（上一个）
  vim.cmd("b#")
  -- 如果切过去了，再删原来的
  if vim.api.nvim_get_current_buf() ~= bufnr then
    vim.api.nvim_buf_delete(bufnr, {})
  end
end, { desc = "关闭 buffer（保留窗口布局）" })

-- =============================================================================
-- Select all
-- =============================================================================
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- =============================================================================
-- Quickfix
-- =============================================================================
map("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<CR>", { desc = "Previous quickfix" })
