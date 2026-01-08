return {
  { 'farmergreg/vim-lastplace' },
  { 'tpope/vim-sleuth' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-eunuch' },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "jessarcher/vim-heritage" }, 
  {
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  }
};
