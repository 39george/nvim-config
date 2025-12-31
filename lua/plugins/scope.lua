return {
  "tiagovla/scope.nvim",
  opts = {
    hooks = {
      pre_tab_leave = function()
        if vim.bo.filetype == "snacks_dashboard" then
          pcall(function() require("snacks").dashboard.close() end)
        end
      end,

      post_tab_enter = function()
        vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
      end,
    },
  },
}
