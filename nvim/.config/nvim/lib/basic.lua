vim.opt.modelines = 0
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.encoding = "utf-8"
vim.opt.laststatus = 2
vim.opt.visualbell = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.signcolumn = "no"
vim.opt.nu = true
-- vim.cmd("colorscheme quiet")
vim.cmd("colorscheme lackluster")
vim.opt.termguicolors = true
-- vim.opt.background = "light"

-- set background to terminal background color
-- vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
-- set visual select background to grey
-- vim.cmd("highlight Visual cterm=NONE gui=NONE ctermbg=7 guibg=#d3d3d3")
-- -- set visual select foreground to black
-- vim.cmd("highlight Visual cterm=NONE gui=NONE ctermfg=0 guifg=#000000")
-- -- set matchparen background to grey
-- vim.cmd("highlight MatchParen cterm=NONE gui=NONE ctermbg=7 guibg=#d3d3d3")
-- -- set matchparen foreground to black
-- vim.cmd("highlight MatchParen cterm=NONE gui=NONE ctermfg=0 guifg=#000000")
-- -- set search background to grey
-- vim.cmd("highlight Search cterm=NONE gui=NONE ctermbg=7 guibg=#d3d3d3")
-- -- set search foreground to black
-- vim.cmd("highlight Search cterm=NONE gui=NONE ctermfg=0 guifg=#000000")
-- -- set search background and foreground
-- vim.cmd("highlight IncSearch cterm=NONE gui=NONE ctermbg=7 guibg=#d3d3d3")
-- vim.cmd("highlight IncSearch cterm=NONE gui=NONE ctermfg=0 guifg=#000000")

-- primarily used for navigating through kernel source tree
vim.opt.tags = "./tags;,tags"
