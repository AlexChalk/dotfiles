-- -----------------------------------------------------
-- -- Clojure
-- -----------------------------------------------------
-- Parinfer on put and delete (comments behaviour in comments.lua)
vim.keymap.set("n", "p", function()
  vim.call("parinfer#put_line")
end, { buffer = 0, noremap = true })

local clojureparinfer =
  vim.api.nvim_create_augroup("clojureparinfer", { clear = true })

vim.api.nvim_create_autocmd("TextChanged", {
  pattern = { "*.clj", "*.cljc", "*.cljs" },
  callback = function()
    local operation = vim.v.operator
    if operation == "d" then
      vim.call("parinfer#process_form")
    end
  end,
  group = clojureparinfer,
})
