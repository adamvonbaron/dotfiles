return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			pickers = {
				find_files = {
					no_ignore = true,
				},
				live_grep = {
					additional_args = function(_)
						return { "--hidden", "--no-ignore" }
					end,
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
