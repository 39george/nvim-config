return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["<CR>"] = "open",
        ["?"] = "show_help",
      },
    },
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          ".uid",
        },
      },
    },
  },
}
