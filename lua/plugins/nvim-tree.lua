-- A file explorer tree for neovim
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ensure you have web dev icons if you want them
  -- stylua: ignore
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Tree" },
    { "<leader>E", "<cmd>NvimTreeFindFile<CR>", desc = "Reveal current buffer in File Tree" },
  },
  opts = function()
    local function my_on_attach(bufnr)
      local nvimtree = require("nvim-tree.api")
      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end
      -- default mappings
      nvimtree.config.mappings.default_on_attach(bufnr)
      -- custom mappings
      vim.keymap.set("n", "?", nvimtree.tree.toggle_help, opts("Help"))
      vim.keymap.set("n", "l", nvimtree.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", nvimtree.node.open.edit, opts("Close"))
    end
    local opts = {
      on_attach = my_on_attach,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_cwd = true,
      actions = {
        change_dir = {
          enable = true,
          global = false,
        },
      },
      tab = {
        sync = {
          open = false,
          close = false,
          ignore = {},
        },
      },
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = {
          min = 30,
          max = -1,
          padding = 1,
          lines_excluded = { "root" },
        },
      },
      filters = {
        dotfiles = true,
        custom = { ".uid" },
      },
      git = {
        enable = true,
      },
      diagnostics = {
        enable = true,
      },
      renderer = {
        group_empty = true,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        highlight_modified = "all", -- "all", "name", "icon" или "none"
        highlight_diagnostics = "all", -- "all", "name", "icon" или "none"
        highlight_git = "all", -- "all", "name", "icon" или "none"
        icons = {
          show = {
            folder_arrow = false,
            file = true,
            folder = true,
            git = true,
          },
          padding = {
            icon = " ", -- Отступ между иконкой и именем
            folder_arrow = " ", -- Отступ между стрелкой и иконкой папки
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "󰆤",
            modified = "✗",
            hidden = "󰜌",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "●",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    }
    return opts
  end,
}
