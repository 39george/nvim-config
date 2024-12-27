if vim.g.neovide == true then
  -- stylua: ignore start
  vim.api.nvim_set_keymap( "n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
  vim.o.guifont = "JetBrains Mono:h12:#e-subpixelantialias:#h-none"
  -- stylua: ignore end
end

