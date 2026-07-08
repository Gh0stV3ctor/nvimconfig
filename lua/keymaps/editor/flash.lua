-- Flash keymaps — mirror of plugins/editor/flash.lua
-- Uses f as a prefix: f is vim's native "find char" operator, but mapping
-- fj/ft creates a sequence. When f is pressed, Neovim waits timeoutlen (300ms)
-- for the next key. If j or t arrives → flash action. If any other single
-- character arrives (or nothing within timeoutlen) → native f{char} operator.
return {
    {
        'fj',
        function() require('flash').jump() end,
        mode = { 'n', 'x', 'o' },
        desc = 'Flash: Jump',
    },
    {
        'ft',
        function() require('flash').treesitter() end,
        mode = { 'n', 'x', 'o' },
        desc = 'Flash: Treesitter Jump',
    },
}
