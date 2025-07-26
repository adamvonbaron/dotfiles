return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		local todo_comments = require("todo-comments")
		todo_comments.setup()
	end,
}
