return {
  "rayliwell/tree-sitter-rstml",
  dependencies = { "nvim-treesitter" },
  cond = false,
  build = ":TSUpdate",
  config = function()
    require("tree-sitter-rstml").setup()
  end,
}
