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

-- Remember folds
vim.api.nvim_create_augroup("remember_folds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*.*",
  callback = function() vim.cmd.mkview() end,
  group = "remember_folds",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.*",
  callback = function() vim.cmd([[silent! loadview]]) end,
  group = "remember_folds",
})
