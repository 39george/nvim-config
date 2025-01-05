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
  },
}
