-- Use h at the first non-blank character of a line (or before) to fold.
-- Use l anywhere on a folded line to unfold it.1 This allows you to ditch
-- zc, zo, and za – you can just use h and l to work with folds.
-- (h still moves left if not at the beginning of a line, and l still moves
-- right when on an unfolded line – this plugin basically "overloads" those keys.)
--
-- Pause folds while searching, restore folds when done with searching.
-- (Normally, folds are opened when you search for some text inside a fold, and stay open afterward.)
--
-- Remember folds across sessions (and as a side effect, also the cursor position).

return {
  "chrisgrieser/nvim-origami",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cond = false,
  opts = {}, -- needed even when using default config
}
