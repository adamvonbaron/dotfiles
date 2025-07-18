return {
	"folke/tokyonight.nvim",
	config = function()
		local tokyonight = require("tokyonight")

		tokyonight.setup({
			on_colors = function(colors)
				colors.bg = "#000000"
				colors.bg_dark = "#000000"
				colors.bg_sidebar = "#000000"
				colors.bg_statusline = "#000000"
			end,
		})
	end,
}
