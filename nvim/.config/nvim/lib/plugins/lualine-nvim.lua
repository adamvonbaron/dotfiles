return {
  "hoob3rt/lualine.nvim",
  config = function()
    local lualine = require('lualine')

    lualine.setup({
      options = {
        theme = "auto",
        component_separators = '|',
        section_separators = '',
      }
    })
  end
}
