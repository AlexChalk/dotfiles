-- -----------------------------------------------------
-- -- Clojure
-- -----------------------------------------------------
-- Linewise parinfer (comments behaviour in comments.lua)
vim.keymap.set(
  "n",
  "dd",
  vim.call("parinfer#delete_line"),
  { buffer = 0, noremap = true }
)

vim.keymap.set(
  "n",
  "p",
  vim.call("parinfer#put_line"),
  { buffer = 0, noremap = true }
)
