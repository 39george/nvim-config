local s = package.config:sub(1, 1)

print(vim.fn.stdpath('config') .. s .. "lua" .. s .. "colorschemes" .. s .. "darcula")
return {
    {
        dir = vim.fn.stdpath('config') .. s .. "lua" .. s .. "colorschemes" .. s .. "darcula",
        priority = 1000,
    },
    {
        dir = vim.fn.stdpath('config') .. s .. "lua" .. s .. "colorschemes" .. s .. "patana",
    },
    {
        dir = vim.fn.stdpath('config') .. s .. "lua" .. s .. "colorschemes" .. s .. "pinky",
        enabled = false,
    },
}
