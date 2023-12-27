return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = {
                "c",
                "css",
                "diff",
                "dockerfile",
                "eex",
                "elixir",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitignore",
                "go",
                "gomod",
                "gosum",
                "graphql",
                "heex",
                "html",
                "htmldjango",
                "http",
                "ini",
                "java",
                "javascript",
                "jq",
                "jsdoc",
                "json",
                "json5",
                "lua",
                "luadoc",
                "m68k",
                "markdown",
                "markdown_inline",
                "objc",
                "prisma",
                "proto",
                "python",
                "regex",
                "ruby",
                "rust",
                "scss",
                "sql",
                "swift",
                "terraform",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml"
            },
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
