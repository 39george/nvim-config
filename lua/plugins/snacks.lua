---@diagnostic disable: undefined-global

if vim.env.PROF then
  -- example for lazy.nvim
  -- change this to the correct path for your plugin manager
  local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
  vim.opt.rtp:append(snacks)
  require("snacks.profiler").startup({
    startup = {
      event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
      -- event = "UIEnter",
      -- event = "VeryLazy",
    },
  })
end

return {
  {
    "folke/snacks.nvim",
    opts = function()
      Snacks.toggle.profiler():map("<leader>pp")
      Snacks.toggle.profiler_highlights():map("<leader>ph")
    end,
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      -- scroll = {},
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      indent = {
        char = "▏",
        animate = { enabled = false },
      },
    },
  },
}
