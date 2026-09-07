-- Basic plugins that dont' require much configuration

return {
    -- autotag
    {
        'windwp/nvim-ts-autotag',
        opts = {}
    },


    -- git signs
    -- {
    --     "lewis6991/gitsigns.nvim",
    --     config = function()
    --         local gs = require("gitsigns")
    --         gs.setup({
    --             signcolumn = true,
    --             current_line_blame = true
    --         })
    --     end
    -- },

    -- colorizer
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            options = {
                parsers = {
                    css = true,
                    tailwind = { enable = true }
                },
                display = {
                    mode = "virtualtext",
                    virtualtext = { position = "before" },
                }
            },

        },
    },

    -- markdown renderer
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    }

}
