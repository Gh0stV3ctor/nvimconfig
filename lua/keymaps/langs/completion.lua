return {
    preset = "default",
    ["<C-y>"] = { "select_and_accept", "fallback" },
    ["<C-j>"] = { "select_next", "fallback_to_mappings" },
    ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
}
