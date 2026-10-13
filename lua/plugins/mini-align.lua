-- Align text by any delimiter: ga (instant) and gA (interactive with preview)
return {
  "echasnovski/mini.align",
  keys = {
    { "ga", mode = { "n", "x" }, desc = "Align" },
    { "gA", mode = { "n", "x" }, desc = "Align with preview" },
  },
  opts = {},
}
