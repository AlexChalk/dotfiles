-- -----------------------------------------------------
-- -- Clojure
-- -----------------------------------------------------
-- Linewise parinfer (comments behaviour in comments.lua)
vim.keymap.set("n", "dd", function()
  vim.call("parinfer#delete_line")
end, { buffer = 0, noremap = true })

vim.keymap.set("n", "p", function()
  vim.call("parinfer#put_line")
end, { buffer = 0, noremap = true })
