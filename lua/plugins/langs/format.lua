return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        keys = require("keymaps.langs.format"),
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format" },
                go = { "gofumpt", "goimports" },
                rust = { "rustfmt" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescriptreact = { "prettierd" },
                json = { "prettierd" },
                yaml = { "prettierd" },
                markdown = { "prettierd" },
                html = { "prettierd" },
                css = { "prettierd" },
            },
            format_on_save = {
                timeout_ms = 3000,
                lsp_format = "fallback",
            },
            notify_on_error = true,
        },
    },
}
