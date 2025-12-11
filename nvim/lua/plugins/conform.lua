return {
    {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      php = { 'phpstan' },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
},
    {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            php = { "pint" },
            javascript = { "prettierd", stop_after_first = true },
            typescript = { "prettierd", stop_after_first = true },
            vue = { "prettierd", stop_after_first = true },
            json = { "prettierd", stop_after_first = true },
            lua = { "lua-format", stop_after_first = true },
            typescriptreact = { "prettierd", stop_after_first = true },
            blade = { "blade-formatter", stop_after_first = true },
        },
    format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 1000,
            -- lsp_format = "fallback",
        },
    },
}
} 
