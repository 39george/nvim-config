-- stylua: ignore start

-- jk for Esc 
vim.keymap.set( "i", "jk", "<ESC>l", { noremap = true, silent = true, desc = "Quit from insert mode to norm" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set( "n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set( "n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set( "n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set( "n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- better up/down
-- 'gj' and 'gk' will treat wrapped lines as separate lines for moving,
-- by default j and k do not that
vim.keymap.set( { "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set( { "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set( { "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set( { "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set( "n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set( "n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set( "n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set( "n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
vim.keymap.set( "n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set( "n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set( "v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set( "v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set( "n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set( "n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set( "n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
vim.keymap.set( "n", "<leader>bd", "<cmd>:b#|bd#<cr>", { desc = "Delete Buffer" })
vim.keymap.set( "n", "<leader>ba", ":%bd|e#|bd#<cr>|\'\"", { desc = "Delete all inactive buffers" })

-- bufferline, Snacks.bufdelete
vim.keymap.set("n", "<A-l>", function() require("bufferline").cycle(1) end, { desc = "Next buffer"})
vim.keymap.set("n", "<A-h>", function() require("bufferline").cycle(-1) end, { desc = "Previous buffer"})
vim.keymap.set("n", "<S-A-l>", function() require("bufferline").move(1) end, { desc = "Move buffer right"})
vim.keymap.set("n", "<S-A-h>", function() require("bufferline").move(-1) end, { desc = "Move buffer left"})
vim.keymap.set("n", "<A-b>", function() require("bufferline").pick() end, { desc = "Pick buffer"})
vim.keymap.set("n", "<A-d>", function() Snacks.bufdelete.delete() end, { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>br", ":BufferLineTabRename ", { desc = "Rename Tab" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
vim.keymap.set( "n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Redraw / Clear hlsearch / Diff Update" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set( "n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set( "x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set( "o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set( "n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set( "x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set( "o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
vim.keymap.set( "i", ",", ",<c-g>u" )
vim.keymap.set( "i", ".", ".<c-g>u" )
vim.keymap.set( "i", ";", ";<c-g>u" )

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- keywordprg
vim.keymap.set( "n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
vim.keymap.set( "v", "<", "<gv")
vim.keymap.set( "v", ">", ">gv")

-- commenting
vim.keymap.set( "n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
vim.keymap.set( "n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
-- To avoid ↑ collision
vim.keymap.del( "n", "gc")

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- location and quickfix
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- diagnostic
---@param next boolean
---@param severity string?
---@return function 
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
---@diagnostic disable-next-line: cast-local-type
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
vim.keymap.set( "n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set( "n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set( "n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set( "n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set( "n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set( "n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set( "n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
vim.keymap.set( "n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
vim.keymap.set( "n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- Terminal Mappings
-- There also <C-\><C-n> for escaping from terminal input
vim.keymap.set( "t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.set( "t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
vim.keymap.set( "n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set( "n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- tabs
-- Not using tabs currently
vim.keymap.set( "n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set( "n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
vim.keymap.set( "n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set( "n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set( "n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set( "n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set( "n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set( "n", "<leader><tab>y", "<cmd>tabm +1<cr>", { desc = "Move Tab Up" })
vim.keymap.set( "n", "<leader><tab>e", "<cmd>tabm -1<cr>", { desc = "Move Tab Down" })

vim.keymap.set( { "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into os clipboard" })

-- Go to (lsp)
vim.keymap.set( "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
vim.keymap.set( "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References" })
vim.keymap.set( "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Goto Implementation" })
vim.keymap.set( "n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Goto T[y]pe Definition" })
vim.keymap.set( "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Goto Declaration" })
-- To avoid ↑ collision
if not vim.fn.has("win32") then 
  vim.keymap.del( "n", "gri")
  vim.keymap.del( "n", "grr")
  vim.keymap.del( { "n", "x" }, "gra")
  vim.keymap.del( "n", "grn")
end 

-- Temporary fix until release nvim-0.11 ready, and blink updated
if vim.fn.has('nvim-0.11') == 1 then
  -- Ensure that forced and not configurable `<Tab>` and `<S-Tab>`
  -- buffer-local mappings don't override already present ones
  local expand_orig = vim.snippet.expand
  vim.snippet.expand = function(...)
    local tab_map = vim.fn.maparg('<Tab>', 'i', false, true)
    local stab_map = vim.fn.maparg('<S-Tab>', 'i', false, true)
    expand_orig(...)
    vim.schedule(function()
      tab_map.buffer, stab_map.buffer = 1, 1
      -- Override temporarily forced buffer-local mappings
      vim.fn.mapset('i', false, tab_map)
      vim.fn.mapset('i', false, stab_map)
    end)
  end
end

-- Snacks
vim.keymap.set( "n", "<leader>ps", function() Snacks.profiler.scratch() end, { desc = "Profiler scratchbuffer" })

-- Neo-tree
vim.keymap.set( "n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Profiler scratchbuffer" })
vim.keymap.set( "n", "<leader>E", "<cmd>Neotree reveal<CR>", { desc = "Profiler scratchbuffer" })

-- stylua: ignore end
