-- return { "nanotech/jellybeans.vim" }

return {
  "metalelf0/jellybeans-nvim",
  dependencies = { "rktjmp/lush.nvim" },
  config = function ()
    require("lush_theme.jellybeans-nvim")
  end
}
