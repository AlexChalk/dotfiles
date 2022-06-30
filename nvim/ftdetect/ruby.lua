vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.ru",
    "Gemfile",
    "Guardfile",
    ".simplecov",
    "*.step",
    "*.json.jbuilder",
  },
  command = "setf ruby",
})
