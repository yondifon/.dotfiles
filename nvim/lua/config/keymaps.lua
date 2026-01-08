-- Space is my leader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlighting.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Allow gf to open non-existent files.
vim.keymap.set("", "gn", ":edit <cfile><CR>")

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set("i", ";;", "<Esc>A;<Esc>")
vim.keymap.set("i", ",,", "<Esc>A,<Esc>")

vim.keymap.set({ "n", "v" }, "<leader>rr", vim.lsp.buf.rename)

vim.keymap.set("n", "<leader>w", ":silent! w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>\\", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>/", ":vsplit<CR>", { noremap = true, silent = true })

for _, mode in ipairs({ "n", "i", "v", "t" }) do
    vim.keymap.set(mode, "<C-h>", "<C-w>h", { noremap = true })
    vim.keymap.set(mode, "<C-j>", "<C-w>j", { noremap = true })
    vim.keymap.set(mode, "<C-k>", "<C-w>k", { noremap = true })
    vim.keymap.set(mode, "<C-l>", "<C-w>l", { noremap = true })
end


