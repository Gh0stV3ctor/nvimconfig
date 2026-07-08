return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    event = 'InsertEnter',
    dependencies = { 'L3MON4D3/LuaSnip' },
    opts = {
      keymap = require('keymaps.langs.completion'),
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = 'rounded' },
        },
        menu = {
          border = 'rounded',
          draw = {
            columns = {
              { 'kind_icon' },
              { 'label', 'label_description', gap = 1 },
              { 'source_name' },
            },
          },
        },
        ghost_text = {
          enabled = true,
          show_with_menu = true,
        },
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        keyword = {
          range = 'full',
        },
      },
      signature = {
        enabled = true,
        window = { border = 'rounded' },
      },
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },
    },
    opts_extend = { 'sources.default' },
  },
}
