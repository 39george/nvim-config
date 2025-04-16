return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  opts = {
    -- Display mode, possible values: "split", "float"
    display_mode = "split",
    -- default_view, body or headers or headers_body
    default_view = "headers_body",
    contenttypes = {
      ["application/json"] = {
        ft = "json",
        formatter = { "jq", "." },
        -- pathresolver = require("kulala.parser.jsonpath").parse,
      },
    },
    -- enable winbar
    winbar = true,
    -- Specify the panes to be displayed by default
    -- Current available pane contains { "body", "headers", "headers_body", "script_output", "stats" },
    default_winbar_panes = {
      "headers_body",
      "script_output",
      "stats",
    },
    certificates = {
      ["localhost"] = {
        cert = "/home/george/.local/share/mkcert/client-local/localhost-client.pem",
        key = "/home/george/.local/share/mkcert/client-local/localhost-client-key.pem",
      },
      ["www.somewhere.com:8443"] = {
        cert = "/home/userx/certs/somewhere.crt",
        key = "/home/userx/certs/somewhere.key",
      },
    },
  },
}
