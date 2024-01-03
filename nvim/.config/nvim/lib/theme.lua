vim.opt.background = "dark"
vim.opt.syntax = "enable"
vim.opt.cursorline = true
vim.opt.synmaxcol = 512
vim.cmd("colorscheme base16-grayscale-dark")

if not vim.g.neovide then
  vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end
