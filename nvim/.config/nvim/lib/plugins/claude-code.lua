return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local claude_code = require("claude-code")

		claude_code.setup()
	end,
}
