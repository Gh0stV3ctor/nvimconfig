return {
    { "]h", function() require("gitsigns").next_hunk() end,            desc = "Next hunk" },
    { "[h", function() require("gitsigns").prev_hunk() end,            desc = "Prev hunk" },
    { "hs", function() require("gitsigns").stage_hunk() end,           desc = "Stage hunk" },
    { "hr", function() require("gitsigns").reset_hunk() end,           desc = "Reset hunk" },
    { "hS", function() require("gitsigns").stage_buffer() end,         desc = "Stage buffer" },
    { "hR", function() require("gitsigns").reset_buffer() end,         desc = "Reset buffer" },
    { "hu", function() require("gitsigns").undo_stage_hunk() end,      desc = "Undo stage hunk" },
    { "hp", function() require("gitsigns").preview_hunk() end,         desc = "Preview hunk" },
    { "hb", function() require("gitsigns").blame_line() end,           desc = "Blame line" },
    {
        "hd",
        function() require("gitsigns").diffthis() end,
        desc = "Diff this",
    },
    {
        "<leader>td",
        function() require("gitsigns").toggle_deleted() end,
        desc = "Toggle deleted lines",
    },
    {
        "<leader>tb",
        function() require("gitsigns").toggle_current_line_blame() end,
        desc = "Toggle blame",
    },
}
