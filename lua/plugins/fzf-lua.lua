-- Improved fzf.vim written in lua

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  -- stylua: ignore
  keys = {
    { "<C-P>", function() require("fzf-lua").files() end, desc = "Fzf files" },
    { "<leader>ss", function() require("fzf-lua").lsp_document_symbols() end, desc = "Fzf document symbols" },
    { "<leader>sS", function() require("fzf-lua").lsp_live_workspace_symbols() end, desc = "Fzf workspace symbols" },
    { "<leader>sd", function() require("fzf-lua").diagnostics_document() end, desc = "Fzf document diagnostics" },
    { "<leader>sD", function() require("fzf-lua").diagnostics_workspace() end, desc = "Fzf workspace diagnostics" },
    { "<leader>sr", function() require("fzf-lua").lsp_references() end, desc = "Fzf lsp references" },
    { "<leader>sg", function() require("fzf-lua").grep_project() end, desc = "Fzf grep project" },
  },
  opts = {
    winopts = {
      border = "rounded",
      backdrop = 80,
      treesitter = true,
    },
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
