require("config.autocmd.separator").setup({
  width = 82,
  default_style = 2, -- например сразу “тройной” как в примере
})

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*", -- Apply to all buffers
  callback = function()
    vim.highlight.on_yank({ higroup = "Yank", timeout = 300 })
  end,
  desc = "Highlight text after yanking", -- Description of the autocommand
})

-- Remember folds / views
local group = vim.api.nvim_create_augroup("remember_folds", { clear = true })
local function is_real_file(buf)
  return vim.bo[buf].buftype == "" and vim.api.nvim_buf_get_name(buf) ~= ""
end
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = group,
  callback = function(args)
    if is_real_file(args.buf) then vim.cmd("silent! mkview") end
  end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = group,
  callback = function(args)
    if is_real_file(args.buf) then vim.cmd("silent! loadview") end
  end,
})
