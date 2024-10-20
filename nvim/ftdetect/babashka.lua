vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    if vim.fn.getline(1):match("^#!.*%s*bb%s*$") then
      vim.api.nvim_buf_set_option(0, "syntax", "clojure")
      vim.api.nvim_buf_set_option(0, "filetype", "clojure")
    end
  end,
})
