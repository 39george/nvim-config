return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = { char = "┊" },
    scope = {
      show_start = false,
      show_end = false,
      highlight = { "Function" },
    },
  },
}
