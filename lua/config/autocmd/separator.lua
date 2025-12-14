local M = {}

M.config = {
  width = 82,
  default_style = 1,
}

local filetype_to_comment = {
  lua = { left = "--", right = "--", dash = "─" },
  rust = { left = "//", right = "//", dash = "─" },
  javascript = { left = "//", right = "//", dash = "─" },
  typescript = { left = "//", right = "//", dash = "─" },
  c = { left = "//", right = "//", dash = "─" },
  cpp = { left = "//", right = "//", dash = "─" },
  go = { left = "//", right = "//", dash = "─" },
  bash = { left = "#", right = "#", dash = "─" },
  sh = { left = "#", right = "#", dash = "─" },
  yaml = { left = "#", right = "#", dash = "─" },
  python = { left = "#", right = "#", dash = "─" },
  sql = { left = "--", right = "--", dash = "─" },
  html = { left = "<!--", right = "-->", dash = "─" },
  css = { left = "/*", right = "*/", dash = "─" },
  scss = { left = "//", right = "//", dash = "─" },
  toml = { left = "#", right = "#", dash = "─" },
  _default = { left = "//", right = "//", dash = "─" },
}

local function trim(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end

local function dw(s) return vim.fn.strdisplaywidth(s) end

local function comment_style()
  return filetype_to_comment[vim.bo.filetype] or filetype_to_comment._default
end

local function inside_width(base, width)
  -- format: <left> <INSIDE> <right>
  return width - dw(base.left) - dw(base.right) - 2
end

local function make_fill_line(base, width, fill)
  local iw = inside_width(base, width)
  if iw < 1 then return base.left .. " " .. base.right end
  return base.left .. " " .. fill:rep(iw) .. " " .. base.right
end

local function clamp_to_width(s, maxw)
  if dw(s) <= maxw then return s end
  return vim.fn.strcharpart(s, 0, maxw)
end

-- style builder helpers
local function single_centered(base, width, dash, title)
  local iw = inside_width(base, width)
  if iw < 1 then
    local line = base.left .. " " .. base.right
    return { lines = { line }, cursor_row_add = 0, cursor_col = #base.left + 1 }
  end

  local text = " " .. title .. " "
  text = clamp_to_width(text, iw)

  local need = iw - dw(text)
  local ld = math.floor(need / 2)
  local rd = need - ld

  local inside = dash:rep(ld) .. text .. dash:rep(rd)
  local line = base.left .. " " .. inside .. " " .. base.right

  -- cursor at start of title text (after left + space + left_dashes + leading space)
  local cursor_col = #(base.left .. " " .. dash:rep(ld) .. " ")
  return { lines = { line }, cursor_row_add = 0, cursor_col = cursor_col }
end

local function triple_centered(base, width, dash, title)
  local iw = inside_width(base, width)
  if iw < 1 then
    local line = base.left .. " " .. base.right
    return { lines = { line }, cursor_row_add = 0, cursor_col = #base.left + 1 }
  end

  local top = make_fill_line(base, width, dash)
  local bot = top

  title = clamp_to_width(title, iw)
  local pad = iw - dw(title)
  local lp = math.floor(pad / 2)
  local rp = pad - lp

  local mid_inside = (" "):rep(lp) .. title .. (" "):rep(rp)
  local mid = base.left .. " " .. mid_inside .. " " .. base.right

  local cursor_col = #(base.left .. " " .. (" "):rep(lp))
  return {
    lines = { top, mid, bot },
    cursor_row_add = 1,
    cursor_col = cursor_col,
  }
end

local function triple_box(base, width, title)
  local iw = inside_width(base, width)
  if iw < 4 then
    return triple_centered(base, width, base.dash or "-", title)
  end

  local horiz = "─"
  local top_inside = "┌" .. horiz:rep(iw - 2) .. "┐"
  local bot_inside = "└" .. horiz:rep(iw - 2) .. "┘"

  local inner_w = iw - 2 -- между │ and │
  title = clamp_to_width(title, inner_w)
  local pad = inner_w - dw(title)
  local lp = math.floor(pad / 2)
  local rp = pad - lp

  local mid_inside = "│" .. (" "):rep(lp) .. title .. (" "):rep(rp) .. "│"

  local top = base.left .. " " .. top_inside .. " " .. base.right
  local mid = base.left .. " " .. mid_inside .. " " .. base.right
  local bot = base.left .. " " .. bot_inside .. " " .. base.right

  local cursor_col = #(base.left .. " " .. "│" .. (" "):rep(lp))
  return {
    lines = { top, mid, bot },
    cursor_row_add = 1,
    cursor_col = cursor_col,
  }
end

-- 1..9 styles
local styles = {
  [1] = function(base, width, title)
    return single_centered(base, width, base.dash or "─", title)
  end,
  [2] = function(base, width, title)
    return triple_centered(base, width, "-", title)
  end,
  [3] = function(base, width, title)
    return triple_centered(base, width, base.dash or "─", title)
  end,
  [4] = function(base, width, title)
    return single_centered(base, width, "-", title)
  end,
  [5] = function(base, width, title)
    return single_centered(base, width, "=", title)
  end,
  [6] = function(base, width, title)
    return single_centered(base, width, "*", title)
  end,
  [7] = function(base, width, title)
    return single_centered(base, width, "━", title)
  end,
  [8] = function(base, width, title) return triple_box(base, width, title) end, -- рамка
  [9] = function(base, width, title)
    return triple_centered(base, width, "·", title)
  end,
}

function M.insert(style_id)
  style_id = tonumber(style_id) or M.config.default_style
  local make = styles[style_id] or styles[M.config.default_style]

  local base = comment_style()
  local width = M.config.width

  local row = vim.api.nvim_win_get_cursor(0)[1] -- 1-based
  local title = trim(vim.api.nvim_get_current_line())

  local out = make(base, width, title)

  local buf = 0
  vim.api.nvim_buf_set_lines(buf, row - 1, row, false, out.lines)

  local target_row = row + (out.cursor_row_add or 0)
  vim.api.nvim_win_set_cursor(0, { target_row, out.cursor_col or 0 })
end

function M.setup(opts)
  if opts then M.config = vim.tbl_deep_extend("force", M.config, opts) end

  vim.api.nvim_create_user_command(
    "CenteredComment",
    function(args) M.insert(args.args) end,
    { nargs = "?" }
  )

  -- <leader>cs = default
  vim.keymap.set(
    "n",
    "<leader>cs",
    function() M.insert(M.config.default_style) end,
    {
      noremap = true,
      silent = true,
      desc = "Centered comment separator (default)",
    }
  )

  -- <leader>cs1..cs9
  for i = 1, 9 do
    vim.keymap.set("n", "<leader>cs" .. i, function() M.insert(i) end, {
      noremap = true,
      silent = true,
      desc = ("Centered separator style %d"):format(i),
    })
  end
end

return M
