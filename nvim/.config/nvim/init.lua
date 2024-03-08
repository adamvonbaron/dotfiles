local linux = os.getenv("OSTYPE") == "linux"

if linux then
	package.path = package.path .. ";/home/adam/.config/nvim/lib/?.lua"
else
	package.path = package.path .. ";/Users/adam/.config/nvim/lib/?.lua"
end

require("plugins")
require("basic")
require("theme")
require("lsp")
