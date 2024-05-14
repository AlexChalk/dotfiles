-- -----------------------------------------------------
-- -- Clojure
-- -----------------------------------------------------
-- Parinfer on put and delete (comments behaviour in comments.lua)
vim.keymap.set("n", "p", function()
  vim.call("parinfer#put_line")
end, { buffer = 0, noremap = true })

vim.keymap.set("n", "dd", function()
  vim.call("parinfer#delete_line")
end, { buffer = 0, noremap = true })

vim.keymap.set('o', 'j', function()
  if vim.v.operator ~= 'd' then
    return 'j'
  else
    return 'j' .. '<Cmd>lua vim.call("parinfer#process_form")<CR>'
  end
end, { buffer = 0, expr = true })

vim.keymap.set('o', 'k', function()
  if vim.v.operator ~= 'd' then
    return 'k'
  else
    return 'k' .. '<Cmd>lua vim.call("parinfer#process_form")<CR>'
  end
end, { buffer = 0, expr = true })
