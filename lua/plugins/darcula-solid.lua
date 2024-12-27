return {
  "briones-gabriel/darcula-solid.nvim",
  dependencies = {
    "rktjmp/lush.nvim",
  },
  lazy = true,
  priority = 1000,
  -- Colorscheme doesn't support setup() function, which lazy calls by default with opts{}
  config = function()
  end,
}
