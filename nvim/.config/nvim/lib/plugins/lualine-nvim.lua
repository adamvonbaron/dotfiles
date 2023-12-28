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
        theme = "auto",
        component_separators = '|',
        section_separators = '',
      }
    })
  end
}
