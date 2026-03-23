return {
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
        require("mini.pairs").setup() -- autopairs
        require("mini.icons").setup() -- icons

        -- git diff and hunks
        require("mini.diff").setup({
            view = {
                style = "sign",
                signs = {
                    add          = '┃',
                    change       = '┃',
                    delete       = '_',
                    topdelete    = '‾',
                    changedelete = '~',
                    untracked    = '┆',
                }
            }
        })


        -- surround
        require("mini.surround").setup({
            mappings = {
                add = 'gsa',       -- Add surrounding in Normal and Visual modes
                delete = 'gsd',    -- Delete surrounding
                find = 'gsf',      -- Find surrounding (to the right)
                find_left = 'gsF', -- Find surrounding (to the left)
                highlight = 'gsh', -- Highlight surrounding
                replace = 'gsr',   -- Replace surrounding

                suffix_last = 'l', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            }
        })

        -- buffer remove
        require("mini.bufremove").setup({
            config = { silent = true }
        })
        vim.keymap.set("n", "<leader>qb", MiniBufremove.delete)


        -- statusline
        require("mini.statusline").setup()

        -- highlight patterns
        local hipatterns = require("mini.hipatterns")
        hipatterns.setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })
    end

}
