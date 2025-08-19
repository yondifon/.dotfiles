-- Testing helper
return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "olimorris/neotest-phpunit",
        "V13Axel/neotest-pest",
    },
    opts = {
        adapters = {
            ["neotest-pest"] = {
                filter_dirs = { "vendor" },
            },
            ["neotest-phpunit"] = {
                root_ignore_files = { "tests/Pest.php" },
                filter_dirs = { "vendor" },
            },
        },
    },
    keys = {
        {
            "<leader>tn",
            function()
                require("neotest").run.run()
            end,
            desc = "Run Neotest",
        },
        {
            "<leader>tf",
            function()
                require("neotest").run.run(vim.fn.expand("%"))
            end,
            desc = "Run Neotest on file",
        },
        {
            "<leader>ta",
            function()
                require("neotest").run.run(vim.uv.cwd() .. "/tests/")
            end,
            desc = "Run All Test Files",
        },
        {
            "<leader>tl",
            function()
                require("neotest").run.run_last()
            end,
            desc = "Run Neotest last",
        },
        {
            "<leader>ts",
            function()
                require("neotest").summary.toggle()
            end,
            desc = "Toggle Neotest summary",
        },
        {
            "<leader>to",
            function()
                require("neotest").output_panel.toggle()
            end,
            desc = "Toggle Neotest output",
        },
    },
}
