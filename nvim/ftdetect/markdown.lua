vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md" },
  callback = function()
    vim.api.nvim_buf_set_option(0, "syntax", "markdown")
    vim.api.nvim_buf_set_option(0, "filetype", "markdown")
  end,
})
