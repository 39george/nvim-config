-- Considerations:
-- Removed all trailing .nvim form plugins names
-- All trailing .<value> in plugin name replaced with -<value>

-- Session options
vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General options

-- stylua: ignore
function _G.CustomFoldText()
  local foldstart = vim.v.foldstart
  local foldend = vim.v.foldend
  local start = vim.fn.substitute(vim.fn.getline(foldstart), "\\t", vim.fn['repeat'](" ", vim.o.tabstop), "")
  return start .. " ... " .. vim.fn.getline(foldend):gsub("^%s*", "") .. " 󰁂 " .. foldend - foldstart + 1
end

vim.o.foldcolumn = "1"
vim.opt.scrolloff = 5
vim.opt.foldtext = "v:lua.CustomFoldText()"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.winblend = 1

vim.cmd("set termguicolors")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set nohls")
vim.cmd("set nowrap")
vim.cmd("set expandtab")
vim.cmd("set mousescroll=ver:1,hor:2")
vim.cmd("set cursorline")
vim.cmd("set nospell")

vim.o.guifont = "JetBrains Mono:h11.25"

-- Setup filetypes
require("config.filetype")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Load all plugins
    { import = "plugins" },
    -- Load local colorschemes
    require("colorschemes.plugins"),
  },
  -- Try to load one of these colorschemes when starting an installation during startup
  install = { colorscheme = { "darcula", "catppuccin" } },
  -- Automatically check for plugin updates
  checker = { enabled = false },
  defaults = {
    lazy = false,
    version = nil,
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = true, -- get a notification when changes are found
  },
})

require("config.keymap")
require("config.tabwidth")
require("config.autocmd")

-- Enable clipboard support in wsl
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
