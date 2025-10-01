vim.cmd("filetype plugin on")
vim.filetype.add({
  extension = {
    -- env = "dotenv",
    http = "http",
    jsfx = "eel2",
  },
  filename = {
    -- [".env"] = "dotenv",
    ["http"] = "http",
  },
  pattern = {
    -- ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
