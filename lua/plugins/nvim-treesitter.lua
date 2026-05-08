-- Nvim Treesitter configurations and abstraction layer

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  init = function()
    local ts_disabled = {
      lua = true,
      rust = true,
    }

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if ts_disabled[ft] then return end

        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start, args.buf)

        -- Enable treesitter-based indentation
        vim.bo[args.buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,

  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    ts.install({
      "rust",
      "yaml",
      "json",
      "http",
      "wgsl",
      "glsl",
      "wgsl_bevy",
      "vim",
      "vimdoc",
      "typescript",
      "typespec",
      "tsx",
      "toml",
      "sql",
      "scss",
      "css",
      "ron",
      "passwd",
      "nginx",
      "markdown",
      "markdown_inline",
      "make",
      "lua",
      "luadoc",
      "javascript",
      "jq",
      "html",
      "graphql",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "gotmpl",
      "gitignore",
      "gitcommit",
      "gitattributes",
      "git_rebase",
      "git_config",
      "dockerfile",
      "diff",
      "csv",
      "c",
      "cpp",
      "c_sharp",
      "comment",
      "cmake",
      "bash",
      "awk",
      "python",
      "proto",
      "solidity",
      "mermaid",
      "gdscript",
      "godot_resource",
      "gdshader",
      "ini",
    })
  end,
}
