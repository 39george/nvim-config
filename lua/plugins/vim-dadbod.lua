return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        lazy = true,
      },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_winwidth = 35

      local ok, list = pcall(dofile, vim.fn.stdpath("data") .. "/dbs.lua")
      local dbs = {}
      for _, d in ipairs(ok and list or {}) do
        table.insert(dbs, {
          name = d.group .. "-" .. d.name,
          url = d.url
            or ("postgres://%s@localhost:%d/%s"):format(d.user, d.port, d.db),
        })
      end
      vim.g.dbs = dbs

      -- Highlight json in dbout
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dbout",
        callback = function(ev)
          vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(ev.buf) then return end
            vim.api.nvim_buf_call(
              ev.buf,
              function()
                vim.cmd([[
                syntax match dboutJsonStr /"\%(\\.\|[^"\\]\)*"/
                syntax match dboutJsonKey /"\%(\\.\|[^"\\]\)*"\ze\s*:/
                syntax match dboutJsonNum /\%(:\s\+\|[\[,]\s*\)\zs-\?\d\+\%(\.\d\+\)\?/
                syntax keyword dboutJsonLit true false null
                syntax keyword dboutNull NULL
              ]])
              end
            )
          end)

          vim.api.nvim_set_hl(0, "dboutJsonStr", { link = "@string" })
          vim.api.nvim_set_hl(0, "dboutJsonKey", { link = "@property" })
          vim.api.nvim_set_hl(0, "dboutJsonNum", { link = "@number" })
          vim.api.nvim_set_hl(0, "dboutJsonLit", { link = "@boolean" })
          vim.api.nvim_set_hl(0, "dboutNull", { link = "Comment" })

          vim.keymap.set("n", "<localleader>j", function()
            vim.cmd([[execute "normal \<Plug>(DBUI_YankCellValue)"]])
            local text = vim.fn.getreg('"')
            vim.cmd("botright new")
            vim.bo.buftype = "nofile"
            vim.bo.bufhidden = "wipe"
            vim.bo.filetype = "json"
            vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(text, "\n"))
            vim.cmd("silent %!jq .")
          end, { buffer = ev.buf, desc = "Open cell as JSON" })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function(ev)
          local map = function(lhs, rhs, desc)
            vim.keymap.set(
              "n",
              lhs,
              rhs,
              { buffer = ev.buf, remap = true, desc = desc }
            )
          end
          map(
            "<localleader>r",
            "mzvip<Plug>(DBUI_ExecuteQuery)`z",
            "Run query under cursor"
          )
          map("<localleader>a", "<Plug>(DBUI_ExecuteQuery)", "Run whole buffer")
          vim.keymap.set(
            "x",
            "<localleader>t",
            [[:!column -t -l 2 -o ' '<CR>gv>]],
            {
              buffer = ev.buf,
              desc = "Align table columns",
            }
          )
        end,
      })
    end,
    -- stylua: ignore
    keys = {
      { "<leader>du", ":DBUIToggle<CR>", mode = "n", desc = "Toggle dbui", },
    },
  },
}
