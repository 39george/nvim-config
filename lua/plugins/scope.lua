return {
  "tiagovla/scope.nvim",
  opts = {
    hooks = {
      pre_tab_leave = function()
        local buf = vim.api.nvim_get_current_buf()
        if vim.bo[buf].filetype == "snacks_dashboard" then
          -- Important: Do not close dashboard in TabLeave
          vim.schedule(function()
            pcall(function() require("snacks").dashboard.close() end)
          end)
        end
        vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
      end,

      post_tab_enter = function()
        vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
      end,
    },
  },
}
