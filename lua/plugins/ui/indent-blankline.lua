return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            indent = {
                char = "│",
            },
            scope = {
                enabled = true,
                char = "│",
                show_start = true,
                show_end = true,
                highlight = { "Keyword", "Conditional" },
            },
            exclude = {
                filetypes = {
                    "help",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                },
                buftypes = { "terminal", "nofile" },
            },
        },
    },
}
