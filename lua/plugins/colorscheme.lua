return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true, -- disables setting the background color.
            styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" },
                conditionals = { "italic" },
                loops = { "italic" },

                functions = { "bold" },
                keywords = { "italic" },

                strings = {},
                variables = {},
                numbers = {},
                booleans = { "bold" },
                properties = {},
                types = { "bold" },
                operators = {},
            }
        })

        vim.cmd [[colorscheme catppuccin-nvim]]
    end
}
