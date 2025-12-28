---@diagnostic disable: undefined-global

if vim.env.PROF then
  -- example for lazy.nvim
  -- change this to the correct path for your plugin manager
  local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
  vim.opt.rtp:append(snacks)
  require("snacks.profiler").startup({
    startup = {
      event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
      -- event = "UIEnter",
      -- event = "VeryLazy",
    },
  })
end

return {
  {
    "folke/snacks.nvim",
    opts = function()
      Snacks.toggle.profiler():map("<leader>pp")
      Snacks.toggle.profiler_highlights():map("<leader>ph")
    end,
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      -- scroll = {},
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      indent = {
        char = "▏",
        animate = { enabled = false },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = {
        width = 60,
        row = nil, -- dashboard position. nil for center
        col = nil, -- dashboard position. nil for center
        pane_gap = 4, -- empty columns between vertical panes
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
        -- These settings are used by some built-in sections
        preset = {
          -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          -- Used by the `keys` section to show keymaps.
          -- Set your custom keymaps here.
          -- When using a function, the `items` argument are the default keymaps.
          ---@type snacks.dashboard.Item[]
          keys = {},
          -- Used by the `header` section
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        -- item field formatters
        formats = {
          icon = function(item)
            if
              item.file and item.icon == "file" or item.icon == "directory"
            then
              return Snacks.dashboard.icon(item.file, item.icon)
            end
            return { item.icon, width = 2, hl = "icon" }
          end,
          footer = { "%s", align = "center" },
          header = { "%s", align = "center" },
          file = function(item, ctx)
            local fname = vim.fn.fnamemodify(item.file, ":~")
            fname = ctx.width
                and #fname > ctx.width
                and vim.fn.pathshorten(fname)
              or fname
            if #fname > ctx.width then
              local dir = vim.fn.fnamemodify(fname, ":h")
              local file = vim.fn.fnamemodify(fname, ":t")
              if dir and file then
                file = file:sub(-(ctx.width - #dir - 2))
                fname = dir .. "/…" .. file
              end
            end
            local dir, file = fname:match("^(.*)/(.+)$")
            return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } }
              or { { fname, hl = "file" } }
          end,
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      }
      if vim.env.CELERIS == "1" then opts.dashboard.enabled = false end
    end,
  },
}
