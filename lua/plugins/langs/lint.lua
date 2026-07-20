return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = require('core.language').linters

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
        callback = function()
          if vim.bo.buftype ~= '' then
            return
          end
          local names = lint.linters_by_ft[vim.bo.filetype]
          if not names then
            return
          end
          names = vim.tbl_filter(function(name)
            local linter = lint.linters[name]
            if not linter then
              return false
            end
            -- nvim-lint linters may have cmd as a string (binary name)
            -- or as a function (dynamic command generation, e.g. stylelint).
            -- vim.fn.executable() requires a string, so skip the check when
            -- cmd is a function — the try_lint() call will handle failures gracefully.
            if type(linter.cmd) == 'function' then
              return true
            end
            return vim.fn.executable(linter.cmd or name) == 1
          end, names)
          if #names > 0 then
            lint.try_lint(names)
          end
        end,
      })
    end,
  },
}
