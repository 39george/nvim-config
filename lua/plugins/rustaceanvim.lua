vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
    enable_clippy = false,
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        checkOnSave = true,
        cargo = {
          allFeatures = false,
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
          -- These proc-macros will be ignored when trying to expand them.
          -- This config takes a map of crate names with the exported proc-macro names to ignore as values.
          ignored = { tauri = { "generate_context" } },
        },
        diagnostics = {
          enable = true,
          -- disabled = { "unresolved-proc-macro", "macro-error" },
          enableExperimental = true,
        },
      },
    },
  },
  -- DAP configuration
  dap = {},
}

return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  -- stylua: ignore
  keys = {
    { "<leader>re", function() vim.cmd.RustLsp({ "explainError" }) end, mode = "n", desc = "Explain error", },
    { "<leader>rE", function() vim.cmd.RustLsp({ "expandMacro" }) end, mode = "n", desc = "Expand macro", },
    { "<leader>rd", function() vim.cmd.RustLsp({ "renderDiagnostic" }) end, mode = "n", desc = "Render diagnostics", },
    { "<leader>rc", function() vim.cmd.RustLsp({ "openCargo" }) end, mode = "n", desc = "Open Cargo", },
    { "<leader>rD", function() vim.cmd.RustLsp({ "openDocs" }) end, mode = "n", desc = "Open docs", },
    { "<leader>rp", function() vim.cmd.RustLsp({ "parentModule" }) end, mode = "n", desc = "Open parent module", },
    { "<leader>rf", function() vim.cmd.RustLsp({ "flyCheck" }) end, mode = "n", desc = "Fly check", },
  },
}
