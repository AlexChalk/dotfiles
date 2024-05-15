-- -----------------------------------------------------
-- -- Clojure
-- -----------------------------------------------------
-- Parinfer on put and delete (comments behaviour in comments.lua)
vim.keymap.set("n", "dd", function()
  vim.call("parinfer#delete_line")
end, { buffer = 0, noremap = true })

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "p",
  'p`[v`]=<Cmd>lua vim.call("parinfer#process_form")<CR>',
  { noremap = true }
)
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "P",
  'P`[v`]=<Cmd>lua vim.call("parinfer#process_form")<CR>',
  { noremap = true }
)

vim.keymap.set("n", "<leader>mp", function()
  vim.call("parinfer#do_indent")
end, { buffer = 0, noremap = true })

-- expr parses function ret value as if you'd set it as a string
vim.keymap.set("o", "j", function()
  if vim.v.operator ~= "d" then
    return "j"
  else
    return "j" .. '<Cmd>lua vim.call("parinfer#process_form")<CR>'
  end
end, { buffer = 0, expr = true })

vim.keymap.set("o", "k", function()
  if vim.v.operator ~= "d" then
    return "k"
  else
    return "k" .. '<Cmd>lua vim.call("parinfer#process_form")<CR>'
  end
end, { buffer = 0, expr = true })
