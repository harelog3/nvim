-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = "wincmd L",
})

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("hightlight_yank", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 200, visual = true })
    end
})

-- no continue on single line comments
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("no_next_comment", {}),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "o" })
    end
})


-- syntax highlighting for dotenv files
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("dotenv_ft", { clear = true }),
    pattern = { ".env", ".env.*" },
    callback = function()
        vim.bo.filetype = "dosini"
    end,
})
