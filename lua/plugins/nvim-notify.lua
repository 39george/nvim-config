return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      fps = 3,
    })
    vim.notify = notify
  end,
}
