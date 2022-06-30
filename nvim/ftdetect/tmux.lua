vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { ".tmux.conf*", "tmux.conf*" },
  command = "setf tmux",
})
