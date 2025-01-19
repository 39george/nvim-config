-- Performant, batteries-included completion plugin for Neovim

return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  dependencies = "rafamadriz/friendly-snippets",

  -- Will be loaded as nvim-lspconfig's dependency
  lazy = true,
  -- use a release tag to download pre-built binaries
  -- version = "0.8.2", -- in 0.9.0 path completion was broken for my config
  version = "0.10.0",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = {
      -- Function to use when expanding LSP provided snippets
      expand = function(snippet)
        vim.snippet.expand(snippet)
      end,
      -- Function to use when checking if a snippet is active
      active = function(filter)
        return vim.snippet.active(filter)
      end,
      -- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
      jump = function(direction)
        vim.snippet.jump(direction)
      end,
    },
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-y>"] = { "select_and_accept" },

      ["<Tab>"] = {
        ---@param cmp table
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },

    appearance = {
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
      kind_icons = vim.tbl_extend("keep", {
        Color = "██", -- Use block instead of icon for color items to make swatches more usable
      }, Icons.kinds),
    },
    completion = {
      -- Show documentation when selecting a completion item
      documentation = { auto_show = true, auto_show_delay_ms = 500 },

      -- Display a preview of the selected item on the current line
      ghost_text = { enabled = true },
      accept = {
        auto_brackets = { enabled = true, default_brackets = { "(", ")" } },
      },
      -- list = { selection = "preselect" },
      list = { selection = { preselect = true, auto_insert = true } },
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", gap = 1 },
            { "kind", gap = 1 },
            { "source_name" },
          },
        },
      },
    },
    signature = { enabled = true },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
  opts_extend = { "sources.default" },
}
