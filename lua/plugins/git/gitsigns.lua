return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    keys = require('keymaps.git.gitsigns'),
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '\u{203E}' },
        changedelete = { text = '~' },
        untracked = { text = '\u{2506}' },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      update_debounce = 100,
      max_file_length = 40000,
      attach_to_untracked = false,
      watch_gitdir = {
        follow_files = true,
      },
    },
  },
}
