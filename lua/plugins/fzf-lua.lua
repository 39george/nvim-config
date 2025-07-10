-- Improved fzf.vim written in lua

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "FzfLua" },
  -- stylua: ignore
  keys = {
    { "<C-P>", function() require("fzf-lua").files() end, desc = "Fzf files" },
    -- { "<leader>ss", function() require("fzf-lua").lsp_document_symbols() end, desc = "Fzf document symbols" },
    { "<leader>ss", function() require("nvim-navbuddy").open() end, desc = "Navbuddy document symbols" },
    { "<leader>sS", function() require("fzf-lua").lsp_live_workspace_symbols() end, desc = "Fzf workspace symbols" },
    { "<leader>sd", function() require("fzf-lua").diagnostics_document() end, desc = "Fzf document diagnostics" },
    { "<leader>sD", function() require("fzf-lua").diagnostics_workspace() end, desc = "Fzf workspace diagnostics" },
    { "<leader>sr", function() require("fzf-lua").lsp_references() end, desc = "Fzf lsp references" },
    { "<leader>sg", function() require("fzf-lua").grep_project() end, desc = "Fzf grep project" },
    { "<leader>ca", mode = {"n", "v"}, function() require("fzf-lua").lsp_code_actions() end, desc = "Code actions" },
  },
  -- stylua: ignore
  opts = {
    winopts = {
      border = "rounded",
      backdrop = 75,
      treesitter = true,
    },
    fzf_opts = {
      ["--prompt"] = "",
      ["--pointer"] = "",
      ["--marker"] = "",
    },
    files = { prompt = "Files❯ ", input_prompt = "Grep For❯ " },
    grep = { prompt = "Rg❯ " },
    colorschemes = { prompt = "Colorschemes❯ " },
    keymaps = { prompt = "Keymaps❯ " },
    quickfix_stack = { prompt = "Quickfix Stack❯ ", marker = "❯" },
    diagnostics = { prompt = "Diagnostics❯ ", },
    args = { prompt = "Args❯ " },
    oldfiles = { prompt = 'History❯ ' },
    buffers = { prompt = 'Buffers❯ ' },
    tabs = { prompt = 'Tabs❯ ' },
    lines = { prompt = 'Lines❯ ' },
    tags = { prompt = 'Tags❯ ' },
    btags = { prompt = 'BTags❯ ' },
    lsp = {
      code_actions = { prompt = 'Code Actions❯ ' },
      finder = { prompt = "LSP Finder❯ ", },
      symbols = { prompt = "Symbols❯ "}
    },
    git = {
      files = { prompt = "Files❯ " },
      status = { prompt = "GitStatus❯ "},
      commits = { prompt = "Commits❯ " },
      bcommits = { prompt = "BCommits❯ " },
      blame = { prompt = "Blame❯ " },
      branches = { prompt = 'Branches❯ ' },
      tags = { prompt = "Tags❯ " },
      stash = { prompt = "Stash❯ " },
      icons = {
        ["M"] = { icon = Icons.git.modified, color = "yellow" },
        ["D"] = { icon = Icons.git.removed, color = "red" },
        ["A"] = { icon = Icons.git.added, color = "green" },
      },
    },
    fzf_colors = { true, ["gutter"] = "-1" },
    keymap = {
      builtin = {
        true,
        ["<C-D>"] = "preview-page-down",
        ["<C-U>"] = "preview-page-up",
      },
    },
  },
}
