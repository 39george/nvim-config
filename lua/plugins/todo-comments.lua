-- Highlight, list and search todo comments in your projects

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
	  -- stylua: ignore
	  keys = {
    { mode = "n", "<leader>ft", "<cmd>TodoFzfLua<CR>", desc = "Fzf find todos" },
		{ "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
		{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
	  },
}
