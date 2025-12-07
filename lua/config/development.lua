if vim.env.NVIM_DEV == "1" then
  P = function(v)
    print(vim.inspect(v))
    return v
  end

  RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
  end

  R = function(name)
    RELOAD(name)
    return require(name)
  end
  vim.keymap.set("n", "<leader>rj", function()
    R("jsight").setup({
      autostart = true,
    })
  end, { desc = "Reload jsight plugin" })
end
