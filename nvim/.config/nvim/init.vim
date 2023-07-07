call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-eunuch'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'elixir-editors/vim-elixir'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'mhinz/vim-mix-format'
Plug 'prettier/vim-prettier', {
      \ 'for': ['javascript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'html'],
      \ 'do': 'npm install --frozen-lockfile --production'
      \ }
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'rust-lang/rust.vim'
Plug 'elubow/cql-vim'
Plug 'fatih/vim-go'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/trouble.nvim'
Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx', 'typescript'],
    \ 'do': 'make install'
    \}
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

set nocompatible
set nowrap
set nobackup
set noswapfile
set nocursorline
set number
set encoding=utf-8
set laststatus=2
set visualbell
colorscheme Civic
set background=light
" set termguicolors
set t_Co=256
syntax enable
" set bg=light
filetype plugin indent on
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cursorline
" highlight clear SignColumn
" highlight Statement ctermfg=63
" highlight Comment ctermfg=245
" highlight Special ctermfg=yellow

" autoformat
autocmd BufWritePre *.ts Prettier
autocmd BufWritePre *.js Prettier
autocmd BufWritePre *.html Prettier
autocmd BufWritePre *.vue Prettier
autocmd BufWritePre *.{ex,exs} %!mix format -
let g:mix_format_on_save = 1

" autoload files in vim within vim (metaboss)
au FocusGained,BufEnter * :checktime

" plugin stuff
let test#strategy = "dispatch"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

noremap <Leader>W :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" nvim-lspconfig and treesitter default stuff
lua << EOF
require("telescope").setup()
local nvim_lsp = require('lspconfig')
local util = require('lspconfig/util')
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = 'vsnip' },
    { { name = 'buffer' } }
  })
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- global servers to install
-- yaml-language-server
-- ocaml-lsp, not ocaml-language-server
-- pyright
-- solargraph
local servers = {
  "yamlls",
  "cssls",
  "dockerls",
  "graphql",
  "html",
  "jsonls",
  "solargraph",
  "sqlls",
  "pyright",
  "hls",
  "ocamllsp",
  "ccls",
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end

nvim_lsp["volar"].setup{
  on_attach = on_attach,
  filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'json'},
}

nvim_lsp["gopls"].setup{
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- have to tell nvim where elixirls is located, not stored in project by default
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#elixirls
nvim_lsp["elixirls"].setup{
  cmd = { "/opt/homebrew/bin/elixir-ls" },
  capabilities = capabilities
}

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

-- need to install tsserver and typescript-language-server globally
-- npm install -g tsserver typescript-language-server
nvim_lsp["tsserver"].setup{
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({})
    ts_utils.setup_client(client)
    buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
    buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
    buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
    on_attach(client, bufnr)
  end,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
}

nvim_lsp["rust_analyzer"].setup{}

-- denols
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
nvim_lsp["denols"].setup{
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

-- lualine
require('lualine').setup{
  options = {
    theme = 'auto',
    icons_enabled = false,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' }
  }
}

-- trouble
require('trouble').setup{
 icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

-- lsp_lines
require("lsp_lines").setup()
vim.diagnostic.config({ virtual_text = false })

-- gitsigns
require("gitsigns").setup({
  signs = {
    add          = { text = '▐' },
		change       = { text = '▐' },
		delete       = { text = '▐' },
		topdelete    = { text = '▐' },
		changedelete = { text = '▐' },
		untracked    = { text = '▐' },
  },
  signcolumn     = true,  -- Toggle with `:Gitsigns toggle_signs`
	linehl         = false, -- Toggle with `:Gitsigns toggle_linehl`
	numhl          = false, -- Toggle with `:Gitsigns toggle_nunhl`
	word_diff      = false, -- Toggle with `:Gitsigns toggle_word_diff`
	sign_priority  = 9,
	watch_gitdir   = {
	  interval     = 1000,
	},
	attach_to_untracked = false,
})

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "css",
    "diff",
    "dockerfile",
    "eex",
    "elixir",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "graphql",
    "heex",
    "html",
    "htmldjango",
    "http",
    "ini",
    "java",
    "javascript",
    "jq",
    "jsdoc",
    "json",
    "json5",
    "lua",
    "luadoc",
    "m68k",
    "markdown",
    "objc",
    "prisma",
    "proto",
    "python",
    "regex",
    "ruby",
    "rust",
    "scss",
    "sql",
    "swift",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml"
  },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect

" Avoid showing message extra message when using completion
" set shortmess+=c

" format python files with black on save
autocmd BufWritePre *.py execute ':Black'

" telescope stuff
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

