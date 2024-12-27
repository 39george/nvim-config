-- Create Neovim themes with real-time feedback, export anywhere

return {
  "rktjmp/lush.nvim",
  -- if you wish to use your own colorscheme:
  -- { dir = '/absolute/path/to/colorscheme', lazy = true },
  cond = function(_) return os.getenv("LUSH") end
}
