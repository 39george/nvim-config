-- "barbar.nvim" - tabline plugin with re-orderable, auto-sizing, clickable tabs,
-- icons, nice highlighting, sort-by commands and a magic jump-to-buffer mode.

return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  cond = false,
  -- stylua: ignore
  opts = {
    animation = false,
    icons = {
      -- Configure the base icons on the bufferline.
      -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
      buffer_index = false,
      buffer_number = false,
      button = "",
      -- Enables / disables diagnostic symbols
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = Icons.diagnostics.Error, },
        [vim.diagnostic.severity.WARN] = { enabled = false },
        [vim.diagnostic.severity.INFO] = { enabled = false },
        [vim.diagnostic.severity.HINT] = { enabled = true, icon = Icons.diagnostics.Hint },
      },
      -- gitsigns = {
      --   added = { enabled = true, icon = Icons.git.added },
      --   changed = { enabled = true, icon = Icons.git.modified },
      --   deleted = { enabled = true, icon = Icons.git.removed },
      -- },

      -- Configure the icons on the bufferline based on the visibility of a buffer.
      -- Supports all the base icon options, plus `modified` and `pinned`.
      alternate = { filetype = { enabled = false } },
      current = { buffer_index = true },
      inactive = { button = "×" },
      visible = { modified = { buffer_number = false } },
    },
  },
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
