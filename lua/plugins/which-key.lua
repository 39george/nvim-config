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
      {
        -- Window
        { "<leader>w", proxy = "<c-w>", group = "windows", expand = function()
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
        local currentBuffer = 0

        -- stylua: ignore
        map( "n", "<leader>hr", ":Rest run<CR>", { desc = "Run request under the cursor", buffer = true })
        map( "n", "<leader>hc", ":Rest cookies<CR>", { desc = "Edit cookies file", buffer = true })
        map( "n", "<leader>hl", ":Rest last<CR>", { desc = "Run last request", buffer = true })
        map( "n", "<leader>hL", ":Rest logs<CR>", { desc = "Edit logs", buffer = true })
        map( "n", "<leader>he", ":Rest env show<CR>", { desc = "Show dotenv file registered to current .http file", buffer = true })

        wk.add({
          { "<leader>h", group = "Rest", icon = "", expand = function()
              return {
                { "<leader>hc", buffer = currentBuffer, desc = "Edit cookies file", },
                { "<leader>hr", buffer = currentBuffer, desc = "Run request under the cursor", },
                { "<leader>hl", buffer = currentBuffer, desc = "Run last request", },
                { "<leader>hL", buffer = currentBuffer, desc = "Edit logs", },
                { "<leader>he", buffer = currentBuffer, desc = "Show dotenv file registered to current .http file", },
              }
            end,
          },
        })
      end,
    })
  end,
}
