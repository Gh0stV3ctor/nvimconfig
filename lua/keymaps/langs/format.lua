return {
  {
    '<leader>fm',
    function()
      require('conform').format({ async = true })
    end,
    desc = 'Format',
  },

  {
    '<leader>ft',
    function()
      vim.b.format_on_save = not (vim.b.format_on_save ~= false)
      vim.notify('Format on save: ' .. (vim.b.format_on_save and 'ON' or 'OFF'))
    end,
    desc = 'Toggle format on save',
  },
}
