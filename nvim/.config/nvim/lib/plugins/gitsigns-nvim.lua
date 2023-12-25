return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            signcolumn          = true,  -- Toggle with `:Gitsigns toggle_signs`
            linehl              = false, -- Toggle with `:Gitsigns toggle_linehl`
            numhl               = false, -- Toggle with `:Gitsigns toggle_nunhl`
            word_diff           = false, -- Toggle with `:Gitsigns toggle_word_diff`
            sign_priority       = 9,
            watch_gitdir        = {
                interval = 1000,
            },
            attach_to_untracked = false,
        })
    end
}
