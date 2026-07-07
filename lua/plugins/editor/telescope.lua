return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = require('keymaps.editor.telescope'),
    opts = function()
      local actions = require('telescope.actions')

      return {
        defaults = {
          preview = true,
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
          },
        },
      }
    end,
  },
}
