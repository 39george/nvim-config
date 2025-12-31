return {
  "tiagovla/scope.nvim",
  opts = (function()
    -- Snacks dashboard workaround: start
    local dashboard_buf ---@type integer|nil
    local inited = false

    local function is_dashboard(buf)
      return buf
        and vim.api.nvim_buf_is_valid(buf)
        and vim.api.nvim_buf_is_loaded(buf)
        and vim.bo[buf].filetype == "snacks_dashboard"
    end

    local function make_safe(buf)
      -- Preserve wipe on close
      vim.bo[buf].bufhidden = "hide"
      vim.bo[buf].buflisted = false
    end

    local function find_existing_dashboard()
      -- Called only when dashboard_buf is not registered
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if
          vim.api.nvim_buf_is_loaded(buf)
          and vim.bo[buf].filetype == "snacks_dashboard"
        then
          return buf
        end
      end
      return nil
    end

    local function init_once()
      if inited then return end
      inited = true

      local aug = vim.api.nvim_create_augroup(
        "ScopeSnacksDashboardSingleton",
        { clear = true }
      )

      vim.api.nvim_create_autocmd("FileType", {
        group = aug,
        pattern = "snacks_dashboard",
        callback = function(ev)
          dashboard_buf = ev.buf
          make_safe(ev.buf)
        end,
      })

      vim.api.nvim_create_autocmd({ "BufWipeout", "BufDelete" }, {
        group = aug,
        callback = function(ev)
          if dashboard_buf == ev.buf then dashboard_buf = nil end
        end,
      })

      -- Seed for already opened dashboard_buf
      dashboard_buf = find_existing_dashboard()
      if is_dashboard(dashboard_buf) then make_safe(dashboard_buf) end
    end
    -- Snacks dashboard workaround: end

    return {
      hooks = {
        pre_tab_leave = function()
          init_once()

          if not is_dashboard(dashboard_buf) then
            dashboard_buf = find_existing_dashboard()
          end

          if is_dashboard(dashboard_buf) then make_safe(dashboard_buf) end
        end,

        post_tab_enter = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
        end,
      },
    }
  end)(),
}
