return {
    "hoob3rt/lualine.nvim",
    config = function()
        local lualine = require('lualine')

        lualine.setup({
          options = {
            theme = "jellybeans",
            icons_enabled = false,
            component_separators = '|',
            section_separators = '',
          }
        })
    end
}
