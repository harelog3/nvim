return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local eslintlsp = "eslint"

    lint.linters_by_ft = {
      javascript = { eslintlsp },
      typescript = { eslintlsp },
      javascriptreact = { eslintlsp },
      typescriptreact = { eslintlsp },
      svelte = { eslintlsp },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end)
  end,
}
