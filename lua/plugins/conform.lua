-- Lightweight yet powerful formatter plugin for Neovim

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo", "Format" },
  -- stylua: ignore
  keys = {
    { "<leader>cf", function()
      require("conform")
      vim.cmd("Format")
    end, mode = "", desc = "Format buffer(selection)" },
    { "<leader>cF", function()
      vim.g.disable_autoformat = not vim.g.disable_autoformat
    end, mode = "", desc = "Toggle autoformat on save" },
  },
  opts = {
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
      -- Good defaults
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "ruff" },
      rust = { "rustfmt", "dx" },
      -- Conform will run the first available formatter
      javascript = { "prettier", stop_after_first = true },
      json = { "prettier" },
      sh = { "shfmt" },
      go = { "goimports", "gofmt" },
      http = { "kulala" },
      markdown = { "prettier" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      objc = { "clang_format" },
      objcpp = { "clang_format" },
      cuda = { "clang_format" },
      proto = { "clang_format" },
      kotlin = { "ktfmt" },
    },
    formatters = {
      ktfmt = {
        command = "ktfmt",
        args = { "--kotlinlang-style", "-" },
      },
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      ruff = {
        -- This can be a string or a function that returns a string.
        -- When defining a new formatter, this is the only field that is required
        command = "ruff",
        -- A list of strings, or a function that returns a list of strings
        -- Return a single string instead of a list to run the command in a shell
        args = { "format", "--stdin-filename", "$FILENAME" },
      },
      prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
      },
      kulala = {
        command = "kulala-fmt",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
      dx = {
        command = "dx",
        args = { "fmt", "-f", "-" },
        stdin = true,
        condition = function(ctx)
          if vim.fn.executable("dx") ~= 1 then
            return false
          end
          local found =
            vim.fs.find("Dioxus.toml", { upward = true, path = ctx.dirname })
          return #found > 0
        end,
      },
      leptosfmt = {
        command = "leptosfmt",
        args = { "-c", "/home/george/leptosfmt.toml", "$FILENAME" },
        stdin = false,
      },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 1000, lsp_format = "fallback" }
    end,
  },
  config = function(_, opts)
    require("conform").setup(opts)

    vim.api.nvim_create_user_command("Format", function(args)
      -- Range format something like works, but nearest lines
      -- outside of range by +-1 also formatted (bug?)
      local range = nil
      if args.count ~= -1 then
        local end_line =
          vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({
        async = true,
        lsp_format = "fallback",
        range = range,
      })
    end, { range = true })

    -- Toggle format on save
    --   vim.api.nvim_create_user_command("FormatDisable", function(args)
    --     if args.bang then
    --       -- FormatDisable! will disable formatting just for this buffer
    --       vim.b.disable_autoformat = true
    --     else
    --       vim.g.disable_autoformat = true
    --     end
    --   end, {
    --     desc = "Disable autoformat-on-save",
    --     bang = true,
    --   })
    --   vim.api.nvim_create_user_command("FormatEnable", function()
    --     vim.b.disable_autoformat = false
    --     vim.g.disable_autoformat = false
    --   end, {
    --     desc = "Re-enable autoformat-on-save",
    --   })
  end,
}
