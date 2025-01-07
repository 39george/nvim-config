if vim.fn.has("win32") then
  vim.g.loaded_man = 1
end

require("config.icons")
require("config.lazy")
vim.cmd("colorscheme darcula")

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*", -- Apply to all buffers
  callback = function()
    require("mini.cursorword").setup()
    vim.highlight.on_yank({ higroup = "Yank", timeout = 300 })
  end,
  desc = "Highlight text after yanking", -- Description of the autocommand
})
