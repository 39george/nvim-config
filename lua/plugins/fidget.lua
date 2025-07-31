-- Extensible UI for Neovim notifications and *LSP progress messages*.

return {
  "j-hui/fidget.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    notification = {
      window = {
        winblend = 100, -- Background color opacity in the notification window
      },
    },
  },
}
