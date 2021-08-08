-- PR for native lua: https://github.com/neovim/neovim/pull/12378
vim.cmd("au BufRead,BufNewFile *.ru,Gemfile,Guardfile,.simplecov,*.step,*.json.jbuilder setf ruby")
