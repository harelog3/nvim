-- returns a table with all the colorschemes

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavor = "mocha",
      transparent_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      transparent = true,
      terminal_colors = true,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      on_colors = function(colors)
        local custom_colors_enabled = false -- set this if you want custom colors for this colorscheme
        if custom_colors_enabled then
          colors.bg = "#011628"
          colors.bg_dark = "#011423"
          colors.bg_float = "#011423"
          colors.bg_highlight = "#143652"
          colors.bg_popup = "#011423"
          colors.bg_search = "#0a64ac"
          colors.bg_sidebar = "#011423"
          colors.bg_statusline = "#011423"
          colors.bg_visual = "#275368"
          colors.border = "#547998"
          colors.fg = "#cbe0f0"
          colors.fg_dark = "#b4d0e9"
          colors.fg_float = "#cbe0f0"
          colors.fg_gutter = "#627e97"
          colors.fg_sidebar = "#b4d0e9"
        end
      end,
    },
  },

  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },
}
