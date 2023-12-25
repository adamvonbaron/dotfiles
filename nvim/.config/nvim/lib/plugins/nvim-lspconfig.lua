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

--[[
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end
--]]

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local util = require("lspconfig/util")

        local cmp_nvim_lsp = require('cmp_nvim_lsp')

        local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

        lspconfig["yamlls"].setup({
            capabilities = capabilities
        })

        lspconfig["cssls"].setup({
            capabilities = capabilities
        })

        lspconfig["dockerls"].setup({
            capabilities = capabilities
        })

        lspconfig["graphql"].setup({
            capabilities = capabilities
        })

        lspconfig["html"].setup({
            capabilities = capabilities
        })

        lspconfig["jsonls"].setup({
            capabilities = capabilities
        })

        lspconfig["solargraph"].setup({
            capabilities = capabilities
        })

        lspconfig["sqlls"].setup({
            capabilities = capabilities
        })

        lspconfig["pyright"].setup({
            capabilities = capabilities
        })

        lspconfig["hls"].setup({
            capabilities = capabilities
        })

        lspconfig["ocamllsp"].setup({
            capabilities = capabilities
        })

        lspconfig["ccls"].setup({
            capabilities = capabilities
        })

        lspconfig["gopls"].setup({
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
            capabilities = capabilities
        })

        local buf_map = function(bufnr, mode, lhs, rhs, opts)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
                silent = true,
            })
        end

        -- need to install tsserver and typescript-language-server globally
        -- bun install -g tsserver typescript-language-server
        lspconfig["tsserver"].setup({
            on_attach = function(client, bufnr)
                client.resolved_capabilities.document_formatting = false
                client.resolved_capabilities.document_range_formatting = false
                local ts_utils = require("nvim-lsp-ts-utils")
                ts_utils.setup({})
                ts_utils.setup_client(client)
                buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
                buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
                buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
                on_attach(client, bufnr)
            end,
            root_dir = util.root_pattern("package.json"),
        })

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities
        })
    end
}
