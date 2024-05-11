local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")
if not status then
  print("lazy missing on path: " .. lazypath)
  return
end

lazy.setup({ { import = "harel.plugins" }, { import = "harel.plugins.lsp" } }, {
  install = {},
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- colorscheme
local tokyo_dark = "tokyodark"
local tokyo_night_night = "tokyonight-night"
local colorscheme = tokyo_dark -- set this as the colorscheme you want (make sure it comes installed)
vim.cmd("colorscheme " .. colorscheme)
