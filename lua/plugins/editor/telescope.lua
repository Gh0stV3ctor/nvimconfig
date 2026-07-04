return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Grep text" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
        },
        opts = function()
            local actions = require("telescope.actions")

            return {
                defaults = {
                    preview = true,
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
            }
        end,
    },
}

