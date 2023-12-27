local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

-- todo: can this just be lazy.setup("plugins")?
lazy.setup({
  spec = {
    require("plugins.vim-rails"),
    require("plugins.vim-surround"),
    require("plugins.vim-fugitive"),
    require('plugins.vim-test'),
    require('plugins.vim-dispatch'),
    require('plugins.vim-commentary'),
    require('plugins.nvim-lspconfig'),
    require('plugins.vim-eunuch'),
    require('plugins.nvim-cmp'),
    require('plugins.cmp-nvim-lsp'),
    require('plugins.cmp-buffer'),
    require("plugins.LuaSnip"),
    require("plugins.cmp_luasnip"),
    require('plugins.black'),
    require('plugins.vim-elixir'),
    require('plugins.telescope-nvim'),
    require('plugins.plenary-nvim'),
    require('plugins.lualine-nvim'),
    require('plugins.vim-mix-format'),
    require('plugins.vim-prettier'),
    require('plugins.rust-vim'),
    require('plugins.cql-vim'),
    require('plugins.vim-go'),
    require('plugins.nvim-treesitter'),
    require('plugins.trouble-nvim'),
    require('plugins.vim-jsdoc'),
    require('plugins.gitsigns-nvim'),
    require("plugins.nvim-web-devicons"),
    require("plugins.lspsaga-nvim"),
    require("plugins.lspkind-nvim"),
    require("plugins.vim-graphql"),
    require("plugins.symbols-outline-nvim"),
    require("plugins.lush-nvim"),
    require("plugins.jellybeans-vim")
  }
})
