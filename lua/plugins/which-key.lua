-- Create key bindings that stick.
-- WhichKey helps you remember your Neovim keymaps,
-- by showing available keybindings in a popup as you type.

return {
  "folke/which-key.nvim",
  dependencies = {
    "nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
    { "<leader>v", function() vim.cmd.RustLsp { 'flyCheck', 'run' } end,         desc = "Verify rust code" },
  },
  opts = {
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
  },
  config = function(_, _)
    local wk = require("which-key")
    -- stylua: ignore start
    wk.add({
      -- Groups
      {
        "<leader>b",
        group = "Buffers",
        expand = function()
          return require("which-key.extras").expand.buf()
        end
      },
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "Files & Fzf" },
      { "<leader>g", group = "VCS?", icon = "" },
      { "<leader>gh", group = "Git" },
      { "<leader>q", group = "Session" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Tests" },
      { "<leader>u", group = "UI" },
      { "<leader>x", group = "Location/Quickfix" },

      -- Rename symbol
      { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", icon = "󰤌" },

      -- Proxies
      {
        -- Window
        {
          "<leader>w",
          proxy = "<c-w>",
          group = "windows",
          expand = function()
            return require("which-key.extras").expand.win()
          end
        },
        { "<c-w>L", desc = "Move window to the right" },
        { "<c-w>H", desc = "Move window to the left" },
      },
      { "<leader>y", icon = "" },
      { "<leader>K", icon = "" },
      { "<leader><Tab>", icon = "󰓩" },

      -- For neovim docs
      { "<C-]>", desc = "Jump to a subject", icon = "g" },
    })
    -- stylua: ignore end

    -- Filetype mappings

    -- Http mappings
    -- stylua: ignore
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "http",
      callback = function()
        local map = vim.keymap.set
        local kulala = require("kulala")

        -- stylua: ignore
        map("n", "<leader>hr", kulala.run, { desc = "Run request under the cursor", buffer = true })
        map("n", "<leader>hi", kulala.inspect, { desc = "Inspect request", buffer = true })
        map("n", "<leader>h]", kulala.jump_next, { desc = "Jump next request", buffer = true })
        map("n", "<leader>h[", kulala.jump_prev, { desc = "Jump previous request", buffer = true })
        map("n", "<leader>hc", kulala.copy, { desc = "Copy as curl", buffer = true })
        map("n", "<leader>hG", kulala.scripts_clear_global, { desc = "Clear global variables", buffer = true })
        map("n", "<leader>hC", kulala.clear_cached_files, { desc = "Clear cache files", buffer = true })

        wk.add({
          { "<leader>h", group = "Kulala", icon = "" }
        })
      end,
    })
  end,
}
