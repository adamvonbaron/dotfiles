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
		require("plugins.vim-surround"),
		require("plugins.vim-test"),
		require("plugins.vim-dispatch"),
		require("plugins.vim-commentary"),
		require("plugins.neodev-nvim"),
		require("plugins.nvim-lspconfig"),
		require("plugins.vim-eunuch"),
		require("plugins.vim-fugitive"),
		require("plugins.nvim-cmp"),
		require("plugins.cmp-nvim-lsp"),
		require("plugins.cmp-buffer"),
		require("plugins.LuaSnip"),
		require("plugins.cmp_luasnip"),
		require("plugins.black"),
		require("plugins.telescope-nvim"),
		require("plugins.plenary-nvim"),
		require("plugins.rust-vim"),
		require("plugins.cql-vim"),
		require("plugins.vim-go"),
		require("plugins.trouble-nvim"),
		require("plugins.lspsaga-nvim"),
		require("plugins.symbols-outline-nvim"),
		require("plugins.nvim-web-devicons"),
		require("plugins.nvim-lualine"),
		require("plugins.nvim-treesitter"),
		require("plugins.copilot-vim"),
		-- require("plugins.bufferline-nvim"),
		require("plugins.conform-nvim"),
		require("plugins.vim-mipssyntax"),
		require("plugins.lackluster-nvim"),
		require("plugins.todo-comments-nvim"),
		require("plugins.nvim-dap"),
		require("plugins.claude-code"),
		require("plugins.vim-rails"),
	},
})
