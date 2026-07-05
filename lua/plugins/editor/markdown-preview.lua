return {
    {
        "iamcco/markdown-preview.nvim",
        keys = {
            {
                "<leader>mp",
                "<cmd>MarkdownPreview<cr>",
                desc = "Markdown Preview",
            },
        },
        build = "cd app && yarn install",
        ft = { "markdown" },
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_refresh_slow = 0
            vim.g.mkdp_open_to_the_world = 0
            vim.g.mkdp_browser = "google-chrome-stable"
        end,
    }
}
