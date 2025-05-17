-- global servers to install
-- yaml-language-server
-- ocaml-lsp, not ocaml-language-server
-- pyright
-- solargraph
-- gopls
-- elixir-ls
-- tsserver (typescript-language-server)
-- rust_analyzer
-- vscode-langservers-extracted
-- ccls

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["solargraph"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["sqlls"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["hls"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["ocamllsp"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["gopls"].setup({
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		})

		-- have to tell nvim where elixirls is located, not stored in project by default
		-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#elixirls
		lspconfig["elixirls"].setup({
			cmd = { "/opt/homebrew/bin/elixir-ls" },
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		local buf_map = function(bufnr, mode, lhs, rhs, opts)
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
				silent = true,
			})
		end

		-- need to install tsserver and typescript-language-server globally
		-- bun install -g tsserver typescript-language-server
		lspconfig["ts_ls"].setup({
			on_attach = function(client, bufnr)
				client.server_capabilities.semanticTokensProvider = nil
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
				local ts_utils = require("nvim-lsp-ts-utils")
				ts_utils.setup({})
				ts_utils.setup_client(client)
				buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
				buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
				buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
				-- on_attach(client, bufnr)
			end,
			root_dir = util.root_pattern("package.json"),
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig["teal_ls"].setup({
			-- capabilities = capabilities,
			-- on_attach = function(client)
			-- 	client.server_capabilities.semanticTokensProvider = nil
			-- end,
		})

		lspconfig["prismals"].setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
	end,
}
