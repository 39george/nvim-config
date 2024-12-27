-- Neovim Lua plugin for autohighlighting word under cursor. Part of 'mini.nvim' library

return {
  "echasnovski/mini.cursorword",
  -- Load that after all, to override theme's highlighting setup
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = function()
    require("mini.cursorword").setup({
      delay = 50,
    })
  end,
}
