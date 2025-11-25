return {
  "OXY2DEV/markview.nvim",
  ft = "markdown",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  -- stylua: ignore
  keys = {
    { "<leader>mt", ":Markview toggle<CR>", mode = "n", desc = "Toggle Markview", },
  },
  opts = {
    preview = {
      enable = false, -- don't auto-enable preview on open
      filetypes = { "markdown" },
    },
  },
}
