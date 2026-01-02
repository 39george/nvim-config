return {
  "rcarriga/nvim-notify",
  cond = false,
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      -- fps = 3,
      max_width = 50,
      render = "wrapped-compact",
    })
    vim.notify = notify
  end,
}
