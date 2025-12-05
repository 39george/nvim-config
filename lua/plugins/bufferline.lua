return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      close_command = function()
        require("mini.bufremove").delete(0, false)
      end,
      right_mouse_command = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = " ",
        },
      },
      -- stylua: ignore
      numbers = function(opts)
        return string.format('%s', opts.ordinal)
      end,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
    },
  },
}
