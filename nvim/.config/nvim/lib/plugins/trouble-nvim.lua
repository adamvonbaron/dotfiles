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

    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
      { silent = true, noremap = true }
    )
  end
}
