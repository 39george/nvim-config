return {
  "hedyhli/outline.nvim",
  config = function()
    -- stylua: ignore
    vim.keymap.set( "n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
    require("outline").setup({})
  end,
}
