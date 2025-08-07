-- Testing helper

return {
    "nvim-neotest/neotest",
    dependencies = {
        "V13Axel/neotest-pest",
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "olimorris/neotest-phpunit",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-pest"),
                require("neotest-phpunit")({
                    root_ignore_files = { "tests/Pest.php" },
                }),
            },
        })

        -- Run the nearest test
        vim.keymap.set("n", "<leader>tn", function()
            require("neotest").run.run()
        end)

        -- Run all tests in the current file
        vim.keymap.set("n", "<leader>tf", function()
            require("neotest").run.run(vim.fn.expand("%"))
        end)

        -- Run the last test
        vim.keymap.set("n", "<leader>tl", function()
            require("neotest").run.run_last()
        end)

        -- Toggle test summary window
        vim.keymap.set("n", "<leader>ts", function()
            require("neotest").summary.toggle()
        end)

        vim.keymap.set("n", "<leader>to", function()
            require("neotest").output_panel.toggle()
        end)
    end,
}
