return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "lua",
                "python",
                "go",
                "rust",
                "c",
                "cpp",
                "bash",
                "markdown",
                "markdown_inline",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "json",
                "yaml",
                "toml",
                "vim",
                "vimdoc",
                "query",
                "regex",
            })

            -- highlight (Neovim built-in, enabled per filetype via treesitter.start)
            -- fold (Neovim built-in, set in options.lua: foldmethod=expr + foldexpr)
            -- indent (nvim-treesitter, enabled per filetype via indentexpr)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lua", "python", "go", "rust", "c", "cpp",
                    "bash", "markdown", "javascript", "typescript",
                    "tsx", "html", "css", "json", "yaml", "toml",
                    "vim", "query", "regex",
                },
                callback = function()
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
