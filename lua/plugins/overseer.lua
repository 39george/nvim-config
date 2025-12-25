return {
  "stevearc/overseer.nvim",
  opts = {
    templates = { "builtin" },
  },
  keys = {
    { "<leader>zr", "<cmd>OverseerRun<cr>", desc = "Overseer: Run task" },
    { "<leader>zl", "<cmd>OverseerToggle<cr>", desc = "Overseer: Toggle list" },
    {
      "<leader>za",
      "<cmd>OverseerTaskAction<cr>",
      desc = "Overseer: Task action (restart/watch/etc)",
    },

    -- “как :term/ :!” но в виде overseer-задачи (удобно под watchexec)
    {
      "<leader>zs",
      "<cmd>OverseerShell<cr>",
      desc = "Overseer: Shell as task",
    },
  },
}
