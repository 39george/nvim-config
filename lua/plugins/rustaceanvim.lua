vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
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
          allFeatures = true,
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
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
}
