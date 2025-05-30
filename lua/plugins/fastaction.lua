-- Efficiency plugin designed to optimize code actions in Neovim
--
-- Popup Interface: Display code actions in a customizable popup window.
--
-- Keybindings: Configure keys to quickly dismiss or select code actions, making your workflow more efficient.
--
-- Priority Handling: Customize the display order of actions based on priority,
-- ensuring the most used actions are always visible on top.
--
-- Flexible Selection: Extendable selection prompt that can replace Neovim's
-- built-in vim.ui.select, providing more versatility in how you interact with lists

return {
  "Chaitanyabsprip/fastaction.nvim",
  lazy = true,
  cond = false,
  keys = {
    -- { mode = { "n", "x" }, "<leader>ca", function() require("fastaction").code_action() end, desc = "Code action" },
  },
  ---@type FastActionConfig
  opts = {},
}
