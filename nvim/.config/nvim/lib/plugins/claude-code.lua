return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local claude_code = require("claude-code")
		claude_code.setup()

		vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<CR>")
		vim.keymap.set("n", "<leader>ccr", "<cmd>ClaudeCodeResume<CR>")
		vim.keymap.set("n", "<leader>ccc", "<cmd>ClaudeCodeContinue<CR>")
	end,
}
