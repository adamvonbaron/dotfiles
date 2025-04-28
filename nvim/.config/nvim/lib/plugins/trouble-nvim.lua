return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require("trouble")
    trouble.setup({
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
      icons = false,
      indent_lines = false,
      fold_open = "v",
      fold_close = ">",
      signs = {
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
      }
    })

    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xd", "<cmd>Trouble symbols toggle focus=false<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "gR", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      { silent = true, noremap = true }
    )
  end
}
