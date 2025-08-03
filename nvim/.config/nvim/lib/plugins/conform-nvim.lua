return {
	"stevearc/conform.nvim",
	init = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {},
			formatters = {
				["mac-mips"] = {
					command = "mac-mips",
					args = { "$FILENAME" },
					stdin = false,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				markdown = { "prettier" },
				python = { "black" },
				rust = { "rustfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "goimports", "gofmt" },
				asm = { "mac-mips" },
				ruby = { "rubocop" },
			},
		})
	end,
}
