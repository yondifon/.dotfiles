return {
{
        "supermaven-inc/supermaven-nvim",
        opts = {
            keymaps = {
                accept_suggestion = "<Tab>",
                clear_suggestion = "<A-c>",
            },
        },
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },
    -- { "augmentcode/augment.vim" },
}
