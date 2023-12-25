return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        local nvim_web_devicons = require("nvim-web-devicons")

        nvim_web_devicons.setup({
            default = true,
        })
    end
}
