package.path = package.path .. ";/Users/adam/.config/nvim/lib/?.lua"

require("plugins")
require("basic")
require("theme")
require("lsp")

if vim.g.neovide then
    require("neovide")
end