return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gs = require("gitsigns")
        gs.setup({
            signcolumn = true,
            current_line_blame = true
        })
    end
}
