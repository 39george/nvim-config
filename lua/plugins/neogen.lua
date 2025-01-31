return {
  "danymat/neogen",
  config = true,
  opts = { snippet_engine = "nvim" },
  keys = {
    {
      "<leader>cg",
      function()
        require("neogen").generate()
      end,
      desc = "Generate documentation",
    },
  },
}
