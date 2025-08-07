return {
    "tanvirtin/vgit.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
        require("vgit").setup()
        vim.keymap.set("n", "<leader>gp", ":VGit project_diff_preview<CR>", { desc = "VGit Project Diff" })
    end,
}
