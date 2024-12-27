-- Improved fzf.vim written in lua

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  -- stylua: ignore
  keys = {
    { "<C-P>", function() require("fzf-lua").files() end, desc = "Fzf files" },
    { "<leader>fs", function() require("fzf-lua").lsp_document_symbols() end, desc = "Fzf document symbols" },
    { "<leader>fS", function() require("fzf-lua").lsp_live_workspace_symbols() end, desc = "Fzf workspace symbols" },
    { "<leader>fd", function() require("fzf-lua").diagnostics_document() end, desc = "Fzf document diagnostics" },
    { "<leader>fD", function() require("fzf-lua").diagnostics_workspace() end, desc = "Fzf workspace diagnostics" },
    { "<leader>fg", function() require("fzf-lua").grep_project() end, desc = "Fzf grep project" },
  },
  opts = {
    fzf_colors = true,
    keymap = {
      builtin = {
        true,
        ["<C-D>"] = "preview-page-down",
        ["<C-U>"] = "preview-page-up",
      },
    },
  },
}
