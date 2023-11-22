local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  'onsails/lspkind.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-treesitter/nvim-treesitter',
  'nvim-tree/nvim-web-devicons',
  'windwp/nvim-autopairs',
  'norcalli/nvim-colorizer.lua',
  'nvim-tree/nvim-web-devicons',
  {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { {'nvim-lua/plenary.nvim'} }
  }
}

local opts = {}

require("lazy").setup(plugins, opts)

