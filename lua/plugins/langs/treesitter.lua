return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSInstall lua python go rust c bash markdown json yaml toml html css javascript typescript tsx",
        lazy = false,
        opts = {
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            install = {
                prefer_git = true,
            },
        },
    },
}
