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
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    }
    return opts
  end,
}
