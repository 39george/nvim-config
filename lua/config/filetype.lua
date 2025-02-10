vim.filetype.add({
  extension = {
    -- env = "dotenv",
    http = "http",
  },
  filename = {
    -- [".env"] = "dotenv",
    ["http"] = "http",
  },
  pattern = {
    -- ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
