-- LSP keymaps (buffer-local, bound on LspAttach)
local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user-lsp-keymaps", { clear = true }),
    callback = function(ev)
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
      end

      -- Navigation
      map("gd", vim.lsp.buf.definition, "Go to definition")
      map("gr", vim.lsp.buf.references, "Find references")
      map("gi", vim.lsp.buf.implementation, "Go to implementation")
      map("gy", vim.lsp.buf.type_definition, "Go to type definition")

      -- Information
      map("K", vim.lsp.buf.hover, "Hover documentation")
      map("<leader>ls", vim.lsp.buf.signature_help, "Signature help")

      -- Refactoring
      map("<leader>rn", vim.lsp.buf.rename, "Rename")
      map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    end,
  })
end

return M
