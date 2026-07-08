return {
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        keys = require('keymaps.editor.flash'),
        opts = {
            labels = 'asdfghjklqwertyuiopzxcvbnm',
            search = {
                multi_window = true,
                wrap = true,
                mode = 'search',
            },
            jump = {
                jumplist = true,
                nohlsearch = true,
            },
            label = {
                rainbow = {
                    enabled = true,
                    shade = 9,
                },
            },
            modes = {
                search = { enabled = true },
                char = {
                    enabled = true,
                    multi_line = true,
                    jump_labels = true,
                },
            },
        },
    },
}
