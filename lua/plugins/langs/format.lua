return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    keys = require('keymaps.langs.format'),
    opts = {
      formatters_by_ft = require('core.language').formatters,

      format_on_save = function(bufnr)
        if vim.b[bufnr].format_on_save == false then
          return
        end

        return {
          timeout_ms = 3000,
          lsp_format = 'fallback',
        }
      end,

      notify_on_error = true,
    },
  },
}
