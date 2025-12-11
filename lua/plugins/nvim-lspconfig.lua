---@diagnostic disable: undefined-field
---@diagnostic disable: unnecessary-if

-- Default Nvim LSP client configurations for various LSP servers.
return {
  "neovim/nvim-lspconfig", -- Add LSP config
  dependencies = { "saghen/blink.cmp" },
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  lazy = true,
  opts = function()
    local lspconfig = require("lspconfig")
    local opts = {
      servers = {
        wgsl_analyzer = {},
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod" },
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, { "go.mod", ".git" }))
          end,
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
          cmd = { "lua-language-server" },
          filetypes = { "lua" },
          single_file_support = true,
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, {
              ".emmyrc.json",
              ".luarc.json",
              ".luacheckrc",
              "stylua.toml",
              "selene.toml",
              "selene.yml",
              ".git",
            }) or vim.fn.getcwd())
          end,

          on_init = function(client, _)
            local function get_luarocks_paths()
              local paths = {}
              local seen = {}

              local ok, out = pcall(vim.fn.system, "luarocks path --lr-path")
              if not ok or type(out) ~= "string" then
                out = ""
              end

              for path in out:gmatch("([^;]+)") do
                path = path
                  :gsub("%?.lua$", "")
                  :gsub("%?/init%.lua$", "")
                  :gsub("^'", "")
                  :gsub("'$", "")
                  :gsub("/$", "")

                if path ~= "" and not seen[path] then
                  if vim.uv and vim.uv.fs_stat(path) then
                    table.insert(paths, path)
                    seen[path] = true
                  else
                    local parent = path:match("(.*)/")
                    if parent and vim.uv.fs_stat(parent) then
                      table.insert(paths, parent)
                      seen[parent] = true
                    end
                  end
                end
              end

              return paths
            end

            local within_nvim = (client.root_dir or "")
              == vim.fn.expand("~/.config/nvim")

            local function get_globals()
              local globals = {}
              local ok, out =
                pcall(vim.fn.system, "luarocks list --porcelain 2>/dev/null")
              if ok and type(out) == "string" then
                for line in out:gmatch("[^\r\n]+") do
                  local name = line:match("^([^%s]+)")
                  if name and name ~= "" then
                    table.insert(globals, name)
                  end
                end
              end

              if within_nvim then
                for builtin_global in pairs({ "vim", "jit" }) do
                  table.insert(globals, builtin_global)
                end
              end
              return globals
            end

            local luarocks_libs = get_luarocks_paths()
            local globals_list = get_globals()

            local libs = {}
            local seen = {}

            for _, lib in ipairs(luarocks_libs) do
              if not seen[lib] then
                table.insert(libs, lib)
                seen[lib] = true
              end
            end

            if within_nvim then
              local runtime_libs = vim.api.nvim_get_runtime_file("", true)
              for _, lib in ipairs(runtime_libs) do
                if not seen[lib] then
                  table.insert(libs, lib)
                  seen[lib] = true
                end
              end
            end

            client.settings = client.settings or {}
            client.settings.Lua =
              vim.tbl_deep_extend("force", client.settings.Lua or {}, {
                runtime = {
                  version = "LuaLatest",
                  path = {
                    "?.lua",
                    "?/init.lua",
                    "?/?.lua",
                    vim.fn.expand "~/.luarocks/share/lua/5.4/?.lua",
                    vim.fn.expand "~/.luarocks/share/lua/5.4/?/init.lua",
                    "/usr/share/5.4/?.lua",
                    "/usr/share/lua/5.4/?/init.lua",
                  },
                },
                workspace = {
                  library = libs,
                  checkThirdParty = false,
                  maxPreload = 5000,
                  preloadFileSize = 500,
                },
                diagnostics = {
                  globals = globals_list,
                  disable = {
                    "undefined-global",
                    "lowercase-global",
                  },
                },
                completion = {
                  enable = true,
                  callSnippet = "Both",
                  keywordSnippet = "Replace",
                  postfix = "@",
                  autoRequire = true,
                  showWord = "Enable",
                  requireString = "Substitute",
                },
                hint = {
                  enable = true,
                  arrayIndex = "Enable",
                  paramType = true,
                  paramName = "All",
                  setType = true,
                },
                signatureHelp = {
                  enable = true,
                },
                type = {
                  castNumberToInteger = true,
                },
                telemetry = {
                  enable = false,
                },
              })

            client.notify("workspace/didChangeConfiguration", {
              settings = client.config.settings,
            })
          end,
        },
        kotlin_lsp = {
          cmd = {
            "/home/george/.local/bin/kotlin-lsp/kotlin-lsp.sh",
            "--stdio",
          },
          filetypes = { "kotlin" },
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, {
              "settings.gradle",
              "settings.gradle.kts",
              "pom.xml",
              "build.gradle",
              "build.gradle.kts",
              "workspace.json",
            }) or vim.fn.getcwd())
          end,
          init_options = {
            storagePath = vim.fn.stdpath("cache") .. "/kotlin_lsp",
          },
          single_file_support = true,
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
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, { ".git" }) or vim.fn.getcwd())
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
          root_dir = function(bufnr, on_dir)
            on_dir(
              vim.fs.root(
                bufnr,
                { "tsconfig.json", "jsconfig.json", "package.json", ".git" }
              ) or vim.fn.getcwd()
            )
          end,
          single_file_support = true,
        },
        clangd = {
          cmd = { "clangd" },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, {
              ".clangd",
              ".clang-tidy",
              ".clang-format",
              "compile_commands.json",
              "compile_flags.txt",
              "configure.ac",
              ".git",
            }) or vim.fn.getcwd())
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
          root_dir = function(bufnr, on_dir)
            on_dir(
              vim.fs.root(bufnr, { "build", ".git", "cmake" })
                or vim.fn.getcwd()
            )
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
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, { "Dockerfile" }) or vim.fn.getcwd())
          end,
          single_file_support = true,
        },
        yamlls = {
          cmd = { "yaml-language-server", "--stdio" },
          filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, { ".git" }) or vim.fn.getcwd())
          end,
          single_file_support = true,
          settings = {
            redhat = { telemetry = { enabled = false } },
          },
        },
        docker_compose_language_service = {
          cmd = { "docker-compose-langserver", "--stdio" },
          filetypes = { "yaml.docker-compose" },
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, {
              "docker-compose.yaml",
              "docker-compose.yml",
              "compose.yaml",
              "compose.yml",
            }) or vim.fn.getcwd())
          end,
          single_file_support = true,
        },
        pyright = {
          cmd = { "pyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, {
              "pyproject.toml",
              "setup.py",
              "setup.cfg",
              "requirements.txt",
              "Pipfile",
              "pyrightconfig.json",
              ".git",
            }) or vim.fn.getcwd())
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
        -- kulala_ls = {},
        gdscript = {
          cmd = { "ncat", "127.0.0.1", "6005" },
          filetypes = { "gd", "gdscript", "gdscript3" },
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, {
              "project.godot",
              ".git",
            }) or vim.fn.getcwd())
          end,
        },
        protols = {
          cmd = { "protols" },
          filetypes = { "proto" },
          single_file_support = true,
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, { ".git" }) or vim.fn.getcwd())
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
          root_dir = function(bufnr, on_dir)
            on_dir(
              vim.fs.root(bufnr, { "package.json", ".git" }) or vim.fn.getcwd()
            )
          end,
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

    -- Configure lsp capabilities to use blink caps
    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = blink.get_lsp_capabilities(config.capabilities)
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
