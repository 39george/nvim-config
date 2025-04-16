local duration_multiplier
if vim.fn.has("win32") then
  duration_multiplier = 0.5
else
  duration_multiplier = 0.9
end

return {
  "karb94/neoscroll.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cond = not vim.env.NOANIM,
  opts = {
    -- stylua: ignore
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
    hide_cursor = true,                        -- Hide cursor while scrolling
    stop_eof = true,                           -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,                 -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true,               -- The cursor will keep on scrolling even if the window cannot scroll further
    duration_multiplier = duration_multiplier, -- Global duration multiplier
    easing = "linear",                         -- Default easing function
    pre_hook = nil,                            -- Function to run before the scrolling animation starts
    post_hook = nil,                           -- Function to run after the scrolling animation ends
    performance_mode = false,                  -- Disable "Performance Mode" on all buffers.
    ignored_events = {                         -- Events ignored while scrolling
      "WinScrolled",
      "CursorMoved",
    },
  },
}
