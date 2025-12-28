return {
  {
    "ramilito/kubectl.nvim",
    version = "2.*",
    dependencies = "saghen/blink.download",
    config = function()
      require("kubectl").setup()
      vim.keymap.set(
        "n",
        "<leader>k",
        function() require("kubectl").toggle() end,
        { noremap = true, silent = true }
      )
    end,
  },
}
