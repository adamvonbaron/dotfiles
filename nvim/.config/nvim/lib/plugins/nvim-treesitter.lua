-- TSInstall asm
-- TSInstall awk
-- TSInstall bash
-- TSInstall c
-- TSInstall cmake
-- TSInstall commonlisp
-- TSInstall cpp
-- TSInstall csv
-- TSInstall cuda
-- TSInstall elixir
-- TSinstall git_config
-- TSInstall git_rebase
-- TSInstall gitattributes
-- TSInstall gitcommit
-- TSInstall gitignore
-- TSInstall glsl
-- TSInstall go
-- TSInstall gomod
-- TSInstall gowork
-- TSInstall gpg
-- TSInstall graphql
-- TSInstall html
-- TSInstall http
-- TSinstall javascript
-- TSInstall jq
-- TSInstall jsdoc
-- TSInstall json
-- TSInstall llvm
-- TSInstall lua
-- TSInstall luadoc
-- TSInstall m68k
-- TSInstall make
-- TSinstall markdown
-- TSInstall meson
-- TSInstall nasm
-- TSInstall ninja
-- TSInstall objc
-- TSInstall ocaml
-- TSInstall python
-- TSInstall ruby
-- TSInstall rust
-- TSInstall scheme
-- TSInstall sql
-- TSInstall ssh_config
-- TSInstall strace
-- TSInstall tsx
-- TSInstall typescript
-- TSInstall vim
-- TSInstall yaml

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "asm",
        "awk",
        "bash",
        "c",
        "cmake",
        "commonlisp",
        "cpp",
        "csv",
        "cuda",
        "elixir",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "glsl",
        "go",
        "gomod",
        "gowork",
        "gpg",
        "graphql",
        "html",
        "http",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "llvm",
        "lua",
        "luadoc",
        "m68k",
        "make",
        "markdown",
        "meson",
        "nasm",
        "ninja",
        "objc",
        "ocaml",
        "python",
        "ruby",
        "rust",
        "scheme",
        "sql",
        "ssh_config",
        "strace",
        "tsx",
        "typescript",
        "vim",
        "yaml"
      },
      sync_install = false,
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      }
    })
  end
}
