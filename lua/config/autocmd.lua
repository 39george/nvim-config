-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*", -- Apply to all buffers
  callback = function()
    require("mini.cursorword").setup()
    vim.highlight.on_yank({ higroup = "Yank", timeout = 300 })
  end,
  desc = "Highlight text after yanking", -- Description of the autocommand
})

function CreateCenteredCommentSeparator()
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
    solidity = { left = "//", right = "//", dash = "─" },
    gdscript = { left = "#", right = "#", dash = "─" },
    toml = { left = "#", right = "#", dash = "─" },
    _default = { left = "//", right = "//", dash = "─" },
  }

  -- Get current line and filetype
  local line = vim.api.nvim_get_current_line():gsub("^%s+", ""):gsub("%s+$", "")
  local ft = vim.bo.filetype
  local max_length = 82 -- Total line width

  -- Get comment style
  local style = filetype_to_comment[ft] or filetype_to_comment._default
  local text = " " .. line .. " "

  -- Calculate available space (minus comment markers and padding)
  local available_space = max_length - #style.left - #style.right - 4
  if available_space < #text then
    text = text:sub(1, available_space)
  end

  -- Calculate dashes needed on each side
  local total_dashes = available_space - #text
  local left_dashes = math.floor(total_dashes / 2)
  local right_dashes = total_dashes - left_dashes

  -- Build the centered line
  local result = style.left
    .. " "
    .. style.dash:rep(left_dashes)
    .. text
    .. style.dash:rep(right_dashes)
    .. " "
    .. style.right

  -- Replace current line
  vim.api.nvim_set_current_line(result)

  -- Position cursor at center of the original text
  local cursor_pos = #style.left + left_dashes + 1
  vim.api.nvim_win_set_cursor(
    0,
    { vim.api.nvim_win_get_cursor(0)[1], cursor_pos }
  )
end

-- Create command and keybinding
vim.api.nvim_create_user_command(
  "CenteredComment",
  CreateCenteredCommentSeparator,
  {}
)
vim.keymap.set("n", "<leader>cs", CreateCenteredCommentSeparator, {
  noremap = true,
  silent = true,
  desc = "Create centered comment separator (80 chars)",
})

-- Disable lsp highlight
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     client.server_capabilities.semanticTokensProvider = nil
--   end,
-- })
