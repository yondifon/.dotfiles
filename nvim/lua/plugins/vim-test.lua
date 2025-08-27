-- nvim/lua/user/plugins/vim-test.lua

return {
    "vim-test/vim-test",
    keys = {
        { "<Leader>tn", ":silent TestNearest<CR>" },
        { "<Leader>tf", ":silent TestFile<CR>" },
        { "<Leader>ts", ":silent TestSuite<CR>" },
        { "<Leader>tl", ":silent TestLast<CR>" },
        { "<Leader>tv", ":silent TestVisit<CR>" },
        { "<Leader>tc", ":FloatermKill<CR>" }, -- Close floaterm manually
    },
    init = function()
        vim.g["test#php#pest#options"] = "-v"
        vim.g["test#strategy"] = "neovim"
        vim.g["test#neovim#term_position"] = "vert"
    end,
}
