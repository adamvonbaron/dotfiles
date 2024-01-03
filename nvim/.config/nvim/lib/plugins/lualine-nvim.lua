return {
  "hoob3rt/lualine.nvim",
  config = function()
    local lualine = require('lualine')

    lualine.setup({
      sections = {
        lualine_x = {
          "encoding",
          {
            "fileformat",
            symbols = {
              unix = ""
            }
          },
          "filetype"
        }
      },
      options = {
        icons_enabled = false,
        theme = "solarized_dark",
        component_separators = '|',
        section_separators = '',
      }
    })
  end
}
