-- Highlight, list and search todo comments in your projects

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {},
	  -- stylua: ignore
	  keys = {
    { "<leader>st", function() require("todo-comments.fzf").todo() end, desc = "Todo" },
    { "<leader>sT", function () require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
		{ "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
		{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
	  },
}
