return {
  "navarasu/onedark.nvim",
  config = function()
    local onedark = require("onedark")
    onedark.setup({
      style = "dark"
    })
    onedark.load()
  end
}
