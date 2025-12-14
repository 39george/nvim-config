require("config.autocmd.separator").setup({
  width = 82,
  default_style = 2, -- например сразу “тройной” как в примере
})

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*", -- Apply to all buffers
  callback = function()
    require("mini.cursorword").setup()
    vim.highlight.on_yank({ higroup = "Yank", timeout = 300 })
  end,
  desc = "Highlight text after yanking", -- Description of the autocommand
})
