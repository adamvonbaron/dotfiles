-- Lsp finder to find the cursor word definition and reference
vim.api.nvim_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', {})

-- Code action
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', {})

-- Hover Doc
vim.api.nvim_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', {})

-- Peek Type definition
vim.api.nvim_set_keymap('n', 'gt', '<cmd>Lspsaga peek_type_definition<CR>', {})

-- Goto Type Definition
vim.api.nvim_set_keymap('n', 'gT', '<cmd>Lspsaga goto_type_definition<CR>', {})

-- Rename
vim.api.nvim_set_keymap('n', 'gr', '<cmd>Lspsaga rename<CR>', {})

-- Preview Definition
vim.api.nvim_set_keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', {})

-- Goto Definition
vim.api.nvim_set_keymap('n', 'gD', '<cmd>Lspsaga goto_definition<CR>', {})

-- Show line diagnostics
vim.api.nvim_set_keymap('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>', {})

-- Jump to next/prev diagnostic
vim.api.nvim_set_keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>', {})
vim.api.nvim_set_keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', {})

-- vim.cmd [[
--   highlight LspSagaHoverBorder guifg=#d7d7d7
--   highlight LspFloatWinBorder guifg=#d7d7d7
--   highlight LspSagaHover guibg=#121212 guifg=#adadad
--   highlight LspSagaSignatureHelp guibg=#121212 guifg=#adadad
-- ]]

return {
  "nvimdev/lspsaga.nvim",
  config = function()
    local lspsaga = require("lspsaga")

    lspsaga.setup({
      border_style = "round",
      lightbulb = {
        sign = false
      },
      symbol_in_winbar = {
        enable = false
      }
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  }
}
