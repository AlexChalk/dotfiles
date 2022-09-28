vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.tf" },
  command = "set syntax=terraform filetype=terraform",
})
