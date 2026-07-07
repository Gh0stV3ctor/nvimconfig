return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      local language = require('core.language')
      require('nvim-treesitter').install(language.treesitter)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = language.treesitter,
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
