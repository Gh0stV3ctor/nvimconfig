return {
  -- Accept
  ['<C-y>'] = { 'select_and_accept', 'fallback' },
  ['<CR>'] = { 'select_and_accept', 'fallback' },
  ['<Tab>'] = { 'select_and_accept', 'fallback' },

  -- Navigate
  ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
  ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },

  -- Close
  ['<C-e>'] = { 'hide', 'fallback' },

  -- Scroll documentation
  ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
  ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },

  -- Signature help (C-s replaces C-space which conflicts with input method)
  ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },

  -- Show documentation popup manually
  ['<C-n>'] = { 'show_documentation', 'hide_documentation', 'fallback' },
}
