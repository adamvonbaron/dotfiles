call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-eunuch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
" TSInstall css
" TSInstall elixir
" TSInstall graphql
" TSInstall javascript
" TSInstall json
" TSInstall ruby
" TSInstall scss
" TSInstall typescript
" TSInstall yaml
" TSInstall python

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'elixir-editors/vim-elixir'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'folke/trouble.nvim'
Plug 'prettier/vim-prettier', {
      \  'do': 'yarn install',
      \  'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'html'] }
Plug 'w0ng/vim-hybrid'
Plug 'mhinz/vim-mix-format'

call plug#end()

set nocompatible
set nowrap
set nobackup
set noswapfile
set cursorline
set number
set encoding=utf-8
set laststatus=2
set visualbell
" set termguicolors
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
syntax enable
filetype plugin indent on
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent

" autoformat
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.erb lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.yaml lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.{ex,exs} %!mix format -
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

set list listchars=tab:»·,trail:·,nbsp:·
noremap <Leader>W :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" nvim-lspconfig and treesitter default stuff
lua << EOF
require("telescope").setup()
local nvim_lsp = require('lspconfig')
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

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "json",
    "python",
    "html",
    "scss",
    "graphql",
    "yaml",
    "ruby",
    "java"
  },
  highlight = {
    enable = true,
  }
}

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

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "yamlls",
  "cssls",
  "tsserver",
  "dockerls",
  "graphql",
  "html",
  "jsonls",
  "solargraph",
  "tsserver",
  "sqls",
  "pyright",
  "vuels",
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end

-- have to tell nvim where elixirls is located, not stored in project by default
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#elixirls
nvim_lsp["elixirls"].setup{
  cmd = { "/opt/homebrew/bin/elixir-ls" },
  capabilities = capabilities
}

require("trouble").setup()

-- lualine
require('lualine').setup{
  options = {
    theme = 'auto'
  }
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


" trouble stuff
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" prettier stuff
let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave,BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html execute ':Prettier'

