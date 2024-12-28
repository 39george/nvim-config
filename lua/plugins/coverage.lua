return {
  "andythigpen/nvim-coverage",
  version = "*",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- stylua: ignore
  keys = {
    { mode = "n", "<leader>ccl", ":Coverage<CR>", desc = "Load coverage" },
    { mode = "n", "<leader>cct", ":CoverageToggle<CR>", desc = "Toggle coverage" },
    { mode = "n", "<leader>ccs", ":CoverageSummary<CR>", desc = "Coverage summary" },
    { mode = "n", "<leader>ccx", ":CoverageClear<CR>", desc = "Clear coverage" },
  },
  opts = {
    auto_reload = true,
    highlights = {
      covered = { link = "@text.diff.add" },
      partial = { link = "@text.warning" },
      uncovered = { link = "@text.danger" },
    },
    signs = {
      covered = { text = "█" },
      partial = { text = "█" },
      uncovered = { text = "█" },
    },
    summary = {},
    lang = {},
  },
}
