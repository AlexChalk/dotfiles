vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    if vim.fn.getline(1):match("^#!.*%s*bb%s*$") then
      vim.bo.filetype = "clojure"
      vim.api.nvim_set_option_value("syntax", "clojure", { buf = 0 })
      vim.api.nvim_set_option_value("filetype", "clojure", { buf = 0 })
    end
  end,
})
