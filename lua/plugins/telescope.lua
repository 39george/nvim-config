-- stylua: ignore
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8", -- or branch = "0.1.x"
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- native sorter for fzf-like speed
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = function() return vim.fn.executable("make") == 1 end },
  },
  keys = {
    -- keep your shortcuts 1:1
    { "<C-P>",        function() require("telescope.builtin").find_files() end,                     desc = "Telescope files" },

    -- you used Navbuddy on this key – keep it as-is
    { "<leader>ss",   function() require("telescope.builtin").lsp_document_symbols() end,                               desc = "Navbuddy document symbols" },

    -- live workspace symbols (closest to fzf-lua lsp_live_workspace_symbols)
    { "<leader>sS",   function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols(
          require("telescope.themes").get_dropdown({})
        )
      end, desc = "Telescope workspace symbols (live)" },

    -- diagnostics
    { "<leader>sd",   function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end,       desc = "Telescope buffer diagnostics" },
    { "<leader>sD",   function() require("telescope.builtin").diagnostics() end,                    desc = "Telescope workspace diagnostics" },

    -- references / grep
    { "<leader>sr",   function() require("telescope.builtin").lsp_references() end,                 desc = "Telescope LSP references" },
    { "<leader>sg",   function() require("telescope.builtin").live_grep() end,                      desc = "Telescope live grep" },

    -- code actions (telescope doesn’t provide a built-in picker here)
    { "<leader>ca",   vim.lsp.buf.code_action,                                                      mode = { "n", "v" }, desc = "Code actions" },

    -- other
    -- { "<leader>sn",   function() require("telescope").extensions.notify.notify() end,               desc = "Telescope notifications" },
  },
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        -- visuals similar to your previous prompts/carets
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        -- make it play nice with your dark theme (winblend=0 because you style via highlights)
        winblend = 0,
        -- sorting: use native fzf if available (loaded below)
        file_ignore_patterns = { ".git/", "node_modules/", "target/" },
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            -- keep your preview scrolling muscle memory
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-u>"] = actions.preview_scrolling_up,
          },
          n = {
            ["?"] = "which_key",
          },
        },
        -- layout_strategy = "horizontal",
        -- layout_config = {
        --   width = 0.90,
        --   height = 0.90,
        --   preview_width = 0.55,
        --   prompt_position = "top",
        -- },
        sorting_strategy = "ascending",
        path_display = { "absolute" },
        dynamic_preview_title = true,
      },
      pickers = {
        -- find_files = {
        --   hidden = true,
        --   no_ignore = false,
        --   theme = "dropdown", -- compact like your fzf UI
        -- },
        live_grep = {
          theme = "ivy",
        },
        diagnostics = {
          theme = "ivy",
          bufnr = nil, -- set by keymaps
        },
        lsp_definitions = {
          initial_mode = "normal",
        },
        lsp_references = {
          initial_mode = "normal",
          theme = "ivy",
          include_declaration = true,
          show_line = true,
        },
        lsp_implementations = {
          initial_mode = "normal",
        },
        lsp_type_definitions = {
          initial_mode = "normal",
        },
        lsp_dynamic_workspace_symbols = {
          -- dropdown keeps it tidy; dynamic = live-like updates
          theme = "dropdown",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- true will override the generic sorter
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",
        },
      },
    }
  end,
  config = function(_, opts)
    require("telescope").setup(opts)
    pcall(require("telescope").load_extension, "fzf")
  end,
}
