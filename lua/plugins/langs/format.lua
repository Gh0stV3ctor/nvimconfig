return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    keys = require('keymaps.langs.format'),
    opts = {
      formatters_by_ft = require('core.language').formatters,
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = 'fallback',
      },
      notify_on_error = true,
    },
  },
}
