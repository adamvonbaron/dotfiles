return {
	"folke/tokyonight.nvim",
	config = function()
		local tokyonight = require("tokyonight")
		local tmux = require("tmux")

		tokyonight.setup({
			on_colors = function(colors)
				if tmux.is_tmux() then
					return
				end

				colors.bg = "#000000"
				colors.bg_dark = "#000000"
				colors.bg_sidebar = "#000000"
				colors.bg_statusline = "#000000"
			end,
		})
	end,
}
