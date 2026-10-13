return {
  "iwe-org/iwe.nvim",
  enabled = false,
  dependencies = {
    -- At least one picker recommended (any of these):
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("iwe").setup({
      -- All options are optional with sensible defaults
    })
  end,
}
