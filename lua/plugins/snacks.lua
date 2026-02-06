return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- picker
        picker = {
            win = {
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "i", "n" } },
                    },
                },
            },
            -- explorer config
            sources = {
                explorer = {
                    layout = {
                        layout = {
                            position = "right",
                            width = 64
                        }
                    },
                    icons = {
                        tree = {
                            vertical = "  ",
                            middle = "  ",
                            last = "  ",
                        },
                        files = {
                            enabled = true,
                            dir = "",
                            dir_open = ""
                        }

                    },
                    win = {
                        list = {
                            keys = {
                                ["o"] = "confirm",
                            },
                        },
                    },
                },
            },
        },

        -- explorer
        explorer = {
            replace_netrw = true,
        },

        -- indentation
        indent = {
            indent = {
                enabled = false,
            },
            chunk = {
                enabled = true,
                char = {
                    horizontal = '─',
                    vertical = '│',
                    corner_top = '╭',
                    corner_bottom = '╰',
                    arrow = '─',
                },
            },
        },


        scroll = { enabled = true },    -- scroll animation
        dashboard = { enabled = true }, -- starter dashboard
        input = { enabled = true },
        words = { enabled = true }
    },
    keys = {

        -- Picker
        {
            "<leader>th",
            function()
                Snacks.picker.files()
            end,
        },
        {
            "<leader>ts",
            function()
                Snacks.picker.grep()
            end,
        },

        {
            "<leader>tb",
            function()
                Snacks.picker.buffers()
            end,
        },

        {
            "<leader>tc",
            function()
                Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
            end,
        },

        -- explorer
        {

            "<leader>e",
            function()
                Snacks.explorer()
            end,
        },
    },
}
