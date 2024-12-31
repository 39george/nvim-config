-- A very fast, powerful, extensible and asynchronous Neovim HTTP client

local function getOS()
  return package.config:sub(1, 1) == "\\" and "win" or "unix"
end

return {
  "rest-nvim/rest.nvim",
  enabled = getOS():match("win") == nil,
  ft = "http",
  lazy = true,
  event = "BufEnter *.http",
  init = function()
    vim.g.rest_nvim = {
      ---@type rest.Opts
      highlight = {
        enable = true,
      },
    }
  end,
}
