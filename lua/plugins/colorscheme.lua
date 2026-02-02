return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        local rosePine = require("rose-pine")
        rosePine.setup({
            variant = "moon"
        })
        vim.cmd("colorscheme rose-pine")
    end
}
