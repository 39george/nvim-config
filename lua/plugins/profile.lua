-- Lua profiler for nvim

local function toggle_profile()
  local prof = require("profile")
  if prof.is_recording() then
    prof.stop()
    vim.ui.input({
      prompt = "Save profile to:",
      completion = "file",
      default = "profile.json",
    }, function(filename)
      if filename then
        prof.export(filename)
        vim.notify(string.format("Wrote %s", filename))
      end
    end)
  else
    prof.start("*")
  end
end

return {
  "stevearc/profile.nvim",
  cond = os.getenv("NVIM_PROFILE") ~= nil,
  config = function()
    ---@module "profile.nvim.profile"
    local prof = require("profile")
    prof.instrument_autocmds()

    local should_profile = os.getenv("NVIM_PROFILE")
    if should_profile ~= nil and should_profile:lower():match("^start") then
      prof.start("*")
    else
      prof.instrument("*")
    end
    vim.keymap.set("", "<f1>", toggle_profile)
  end,
}
