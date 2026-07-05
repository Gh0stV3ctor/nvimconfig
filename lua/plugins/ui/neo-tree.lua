return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        cmd = "Neotree",
        keys = require("keymaps.ui.neo-tree"),
        opts = {
          filesystem = {
            follow_current_file = { enabled = true },
            filtered_items = { hide_gitignored = true },
            hijack_netrw_behavior = "open_default",
          },
        },
    },
}
