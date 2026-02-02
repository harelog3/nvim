-- simple plugins that don't require much configuration, centralized in a single file

return {
    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- autotag
    {
        'windwp/nvim-ts-autotag',
        opts = {}
    },

    -- web dev icons
    { "nvim-tree/nvim-web-devicons", opts = {} },

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
        opts = { -- set to setup table
        },
    },

    -- todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {

        }
    }
}
