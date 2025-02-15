-- Nvim Treesitter configurations and abstraction layer

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      parser_install_dir = vim.fn.stdpath("data") .. "/nvim-treesitter/parsers",
      highlight = { enable = true },
      indent = { enable = true },
      -- Installed:
      -- rust
      -- yaml
      -- json
      -- jsonc
      -- http
      -- wgsl
      -- glsl
      -- wgsl_bevy
      -- vim
      -- vimdoc
      -- typescript
      -- tsx
      -- toml
      -- sql
      -- scss
      -- css
      -- ron
      -- passwd
      -- nginx
      -- markdown
      -- markdown_inline
      -- make
      -- lua
      -- luadoc
      -- javascript
      -- jq
      -- html
      -- graphql
      -- go
      -- gomod
      -- gosum
      -- gowork
      -- gotmpl
      -- gitignore
      -- gitcommit
      -- gitattributes
      -- git_rebase
      -- git_config
      -- dockerfile
      -- diff
      -- csv
      -- c
      -- cpp
      -- c_sharp
      -- comment
      -- cmake
      -- bash
      -- awk
      -- python
      -- proto
      auto_install = false,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
    local function silent_cmd(cmd)
      ---@diagnostic disable-next-line: param-type-mismatch
      local success, err = pcall(vim.cmd, cmd)
      if not success then
        print("Error running command: " .. err)
      end
    end
    silent_cmd("TSEnable highlight")
    vim.opt.runtimepath:append(
      vim.fn.stdpath("data") .. "/nvim-treesitter/parsers"
    )
  end,
}
