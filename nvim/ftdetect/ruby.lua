-- PR for native lua: https://github.com/neovim/neovim/pull/14661
vim.cmd(
  "au BufRead,BufNewFile *.ru,Gemfile,Guardfile,.simplecov,*.step,*.json.jbuilder setf ruby"
)
