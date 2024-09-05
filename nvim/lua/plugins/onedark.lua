return {
  "navarasu/onedark.nvim",
  version = "*",
  config = function()
    require('onedark').setup {
      transparent = true
    }
    require("onedark").load()
  end,
}

