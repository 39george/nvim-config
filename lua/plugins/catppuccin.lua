return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = function()
    local opts = {
      default_integrations = true,
      integrations = {
        neotest = true,
        which_key = true,
        grug_far = true,
        headlines = true,
        barbar = true,
        fidget = true,
        cmp = false,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        blink_cmp = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        fzf = true,
      },
      -- Added for gitsigns feature of barbar plugin for mocha flavor
      custom_highlights = function(colors)
        return {
          -- Current buffer
          BufferCurrentADDED = { bg = colors.surface1, fg = colors.green },
          BufferCurrentCHANGED = { bg = colors.surface1, fg = colors.yellow },
          BufferCurrentDELETED = { bg = colors.surface1, fg = colors.red },
          BufferCurrentINFO = { bg = colors.surface1, fg = colors.sapphire },
          BufferCurrentHINT = { bg = colors.surface1, fg = colors.teal },
          BufferCurrentERROR = { bg = colors.surface1, fg = colors.red },

          -- Inactive buffer
          BufferInactiveADDED = { bg = colors.mantle, fg = colors.green },
          BufferInactiveCHANGED = { bg = colors.mantle, fg = colors.yellow },
          BufferInactiveDELETED = { bg = colors.mantle, fg = colors.red },
          BufferInactiveINFO = { bg = colors.mantle, fg = colors.sapphire },
          BufferInactiveHINT = { bg = colors.mantle, fg = colors.teal },
          BufferInactiveERROR = { bg = colors.mantle, fg = colors.red },

          MiniCursorwordCurrent = { link = "Visual" },
          MiniCursorword = { link = "Visual" },
        }
      end,
    }
    return opts
  end,
}
