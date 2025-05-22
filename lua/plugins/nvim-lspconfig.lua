-- Default Nvim LSP client configurations for various LSP servers.
return {
  "neovim/nvim-lspconfig", -- Add LSP config
  dependencies = {
    "saghen/blink.cmp",
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = { "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" },
      opts = { lsp = { auto_attach = true } },
    },
  },
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  lazy = true,
  opts = function()
    local lspconfig = require("lspconfig")
    local opts = {
      servers = {
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod" },
          root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
          settings = {
            gopls = {
              gofumpt = true,
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              semanticTokens = true,
            },
          },
        },
        lua_ls = {
          -- on_init = function(client)
          --   if client.workspace_folders then
          --     local path = client.workspace_folders[1].name
          --     if
          --       vim.uv.fs_stat(path .. "/.luarc.json")
          --       or vim.uv.fs_stat(path .. "/.luarc.jsonc")
          --     then
          --       return
          --     end
          --   end
          -- end,
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
                keywordSnippet = "Replace",
                displayContext = 5, -- Display 5 lines of completion context
              },
              runtime = {
                version = "LuaJIT",
                path = {
                  "?.lua",
                  "?/init.lua",
                  vim.fn.expand("~/.local/share/lux/tree/5.4/?/?.lua"),
                  vim.fn.expand("~/.local/share/lux/tree/5.4/?/init.lua"),
                  vim.fn.expand("~/.local/share/lux/tree/5.4/?/init.lua"),
                },
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = true,
                library = {
                  vim.fn.expand("~/.local/share/lux/tree/5.4"),
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
              },
              telemetry = {
                enable = false,
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
              },
            },
          },
          single_file_support = true,
          root_dir = lspconfig.util.root_pattern(
            ".luarc.json",
            ".luarc.jsonc",
            ".luacheckrc",
            "stylua.toml",
            "selene.toml",
            "selene.yml",
            ".git"
          ),
        },
        bashls = {
          cmd = { "bash-language-server", "start" },
          settings = {
            bashIde = {
              -- Glob pattern for finding and parsing shell script files in the workspace.
              -- Used by the background analysis features across files.

              -- Prevent recursive scanning which will cause issues when opening a file
              -- directly in the home directory (e.g. ~/foo.sh).
              --
              -- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
              globPattern = vim.env.GLOB_PATTERN
                or "*@(.sh|.inc|.bash|.command)",
            },
          },
          filetypes = { "bash", "sh" },
          root_dir = function(fname)
            return vim.fs.dirname(
              vim.fs.find(".git", { path = fname, upward = true })[1]
            )
          end,
          single_file_support = true,
        },
        ts_ls = {
          init_options = { hostInfo = "neovim" },
          cmd = { "typescript-language-server", "--stdio" },
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          root_dir = require("lspconfig.util").root_pattern(
            "tsconfig.json",
            "jsconfig.json",
            "package.json",
            ".git"
          ),
          single_file_support = true,
        },
        clangd = {
          cmd = { "clangd" },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern(
              ".clangd",
              ".clang-tidy",
              ".clang-format",
              "compile_commands.json",
              "compile_flags.txt",
              "configure.ac"
            )(fname) or vim.fs.dirname(
              vim.fs.find(".git", { path = fname, upward = true })[1]
            )
          end,
          single_file_support = true,
          capabilities = {
            textDocument = {
              completion = {
                editsNearCursor = true,
              },
            },
            offsetEncoding = { "utf-8", "utf-16" },
          },
          commands = {
            ClangdSwitchSourceHeader = {
              function()
                local util = require("lspconfig.util")
                local bufnr = 0
                local method_name = "textDocument/switchSourceHeader"
                bufnr = util.validate_bufnr(bufnr)
                local client = util.get_active_client_by_name(bufnr, "clangd")
                if not client then
                  return vim.notify(
                    ("method %s is not supported by any servers active on the current buffer"):format(
                      method_name
                    )
                  )
                end
                local params = vim.lsp.util.make_text_document_params(bufnr)
                client.request(method_name, params, function(err, result)
                  if err then
                    error(tostring(err))
                  end
                  if not result then
                    vim.notify("corresponding file cannot be determined")
                    return
                  end
                  vim.cmd.edit(vim.uri_to_fname(result))
                end, bufnr)
              end,
              description = "Switch between source/header",
            },
            ClangdShowSymbolInfo = {
              function()
                local util = require("lspconfig.util")
                local bufnr = vim.api.nvim_get_current_buf()
                local clangd_client =
                  util.get_active_client_by_name(bufnr, "clangd")
                if
                  not clangd_client
                  or not clangd_client.supports_method(
                    "textDocument/symbolInfo"
                  )
                then
                  return vim.notify(
                    "Clangd client not found",
                    vim.log.levels.ERROR
                  )
                end
                local win = vim.api.nvim_get_current_win()
                local params = vim.lsp.util.make_position_params(
                  win,
                  clangd_client.offset_encoding
                )
                clangd_client.request(
                  "textDocument/symbolInfo",
                  params,
                  function(err, res)
                    if err or #res == 0 then
                      -- Clangd always returns an error, there is not reason to parse it
                      return
                    end
                    local container =
                      string.format("container: %s", res[1].containerName) ---@type string
                    local name = string.format("name: %s", res[1].name) ---@type string
                    vim.lsp.util.open_floating_preview(
                      { name, container },
                      "",
                      {
                        height = 2,
                        width = math.max(
                          string.len(name),
                          string.len(container)
                        ),
                        focusable = false,
                        focus = false,
                        border = "single",
                        title = "Symbol Info",
                      }
                    )
                  end,
                  bufnr
                )
              end,
              description = "Show symbol info",
            },
          },
        },
        neocmake = {
          cmd = { "neocmakelsp", "--stdio" },
          filetypes = { "cmake" },
          root_dir = function(fname)
            return lspconfig.util.root_pattern(
              unpack({ ".git", "build", "cmake" })
            )(fname)
          end,
          single_file_support = true,
          init_options = {
            format = {
              enable = true,
            },
            lint = {
              enable = true,
            },
            scan_cmake_in_package = true, -- default is true
          },
        },
        dockerls = {
          cmd = { "docker-langserver", "--stdio" },
          filetypes = { "dockerfile" },
          root_dir = lspconfig.util.root_pattern("Dockerfile"),
          single_file_support = true,
        },
        yamlls = {
          cmd = { "yaml-language-server", "--stdio" },
          filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
          root_dir = function(fname)
            return vim.fs.dirname(
              vim.fs.find(".git", { path = fname, upward = true })[1]
            )
          end,
          single_file_support = true,
          settings = {
            redhat = { telemetry = { enabled = false } },
          },
        },
        docker_compose_language_service = {
          cmd = { "docker-compose-langserver", "--stdio" },
          filetypes = { "yaml.docker-compose" },
          root_dir = lspconfig.util.root_pattern(
            "docker-compose.yaml",
            "docker-compose.yml",
            "compose.yaml",
            "compose.yml"
          ),
          single_file_support = true,
        },
        pyright = {
          cmd = { "pyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_dir = function(fname)
            return lspconfig.util.root_pattern(unpack({
              "pyproject.toml",
              "setup.py",
              "setup.cfg",
              "requirements.txt",
              "Pipfile",
              "pyrightconfig.json",
              ".git",
            }))(fname)
          end,
          single_file_support = true,
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
          commands = {
            PyrightOrganizeImports = {
              function()
                local params = {
                  command = "pyright.organizeimports",
                  arguments = { vim.uri_from_bufnr(0) },
                }

                local clients = lspconfig.util.get_lsp_clients({
                  bufnr = vim.api.nvim_get_current_buf(),
                  name = "pyright",
                })
                for _, client in ipairs(clients) do
                  client.request("workspace/executeCommand", params, nil, 0)
                end
              end,
              description = "Organize Imports",
            },
            PyrightSetPythonPath = {
              function(path)
                local clients = lspconfig.util.get_lsp_clients({
                  bufnr = vim.api.nvim_get_current_buf(),
                  name = "pyright",
                })
                for _, client in ipairs(clients) do
                  if client.settings then
                    client.settings.python = vim.tbl_deep_extend(
                      "force",
                      client.settings.python,
                      { pythonPath = path }
                    )
                  else
                    client.config.settings = vim.tbl_deep_extend(
                      "force",
                      client.config.settings,
                      { python = { pythonPath = path } }
                    )
                  end
                  client.notify(
                    "workspace/didChangeConfiguration",
                    { settings = nil }
                  )
                end
              end,
              description = "Reconfigure pyright with the provided python path",
              nargs = 1,
              complete = "file",
            },
          },
        },
        kulala_ls = {},
        gdscript = {
          cmd = { "ncat", "127.0.0.1", "6005" },
          filetypes = { "gd", "gdscript", "gdscript3" },
          root_dir = require("lspconfig.util").root_pattern(
            "project.godot",
            ".git"
          ),
        },
        protols = {
          cmd = { "protols" },
          filetypes = { "proto" },
          single_file_support = true,
          root_dir = function(fname)
            return vim.fs.dirname(
              vim.fs.find(".git", { path = fname, upward = true })[1]
            )
          end,
        },
        -- solidity_ls = {
        --   cmd = { "vscode-solidity-server", "--stdio" },
        --   filetypes = { "solidity" },
        --   root_dir = require("lspconfig.util").root_pattern(unpack({
        --     "hardhat.config.js",
        --     "hardhat.config.ts",
        --     "foundry.toml",
        --     "remappings.txt",
        --     "truffle.js",
        --     "truffle-config.js",
        --     "ape-config.yaml",
        --   }))
        --     or require("lspconfig.util").root_pattern(".git", "package.json"),
        --   single_file_support = true,
        -- },
        cssls = {
          cmd = { "vscode-css-language-server", "--stdio" },
          filetypes = { "css", "scss", "less" },
          init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
          root_dir = require("lspconfig.util").root_pattern(
            "package.json",
            ".git"
          ),
          single_file_support = true,
          settings = {
            css = { validate = true },
            scss = { validate = true },
            less = { validate = true },
          },
        },
      },
    }
    return opts
  end,
  -- Overriding config is mandatory here, because nvim-lspconfig has setup()
  -- function for each lspserver entry, like not lspconfig.setup({}), but lspconfig.golsp.setup({})
  config = function(_, opts)
    local blink = require("blink.cmp")
    local lspconfig = require("lspconfig")

    -- Configure lsp capabilities to use blink caps
    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = blink.get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
