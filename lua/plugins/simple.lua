-- simple plugins that don't require much configuration, centralized in a single file

return {
    -- autotag
    {
        'windwp/nvim-ts-autotag',
        opts = {}
    },


    -- git signs
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gs = require("gitsigns")
            gs.setup({
                signcolumn = true,
                current_line_blame = true
            })
        end
    },

    -- colorizer
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            user_default_options = {
                tailwind = "both",
                tailwind_opts = { update_names = true }
            }
        },
    },

}
