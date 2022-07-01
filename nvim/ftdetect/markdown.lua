vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md" },
  command = "set syntax=markdown filetype=markdown",
})
