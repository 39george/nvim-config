if vim.fn.has("win32") then vim.g.loaded_man = 1 end

require("config.icons")
require("config.lazy")
vim.cmd("colorscheme nordic")
-- vim.cmd("colorscheme darcula")
