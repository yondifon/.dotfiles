return {
-- LINTING
{
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    
    -- Define linters
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      php = { "phpstan" },
    }

    -- Simple autocmd to lint on save
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function() lint.try_lint() end,
    })
  end,
},

-- FORMATTING
{
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      php = { "pint" },
      lua = { "stylua" },
      blade = { "blade-formatter" },
      -- Use a sub-table to apply Prettier to all web types at once
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      vue = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback",
    },
  },
},
}
