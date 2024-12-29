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
      { "<leader>b", group = "Buffers", expand = function()
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

      -- Fastaction
      { mode = { "n", "x" }, desc = "Code action", icon = "", },
      -- Rename symbol
      { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", icon = "󰤌" },

      -- Proxies
      { "<leader>w", proxy = "<c-w>", group = "windows", expand = function()
          return require("which-key.extras").expand.win()
        end
      },
      { "<leader>y", icon = "" },
      { "<leader>K", icon = "" },
      { "<leader><Tab>", icon = "󰓩" },
      -- For neovim docs
      { "<C-]>", desc = "Jump to a subject", icon = "g" },
    })
    -- stylua: ignore end
  end,
}
