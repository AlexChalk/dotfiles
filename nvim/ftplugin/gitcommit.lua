-- Not sure how to access this from lua unless globally scoped right now
function _G.conventional_commit_type()
  vim.fn.complete(1, {'build', 'ci', 'chore', 'docs', 'feat', 'fix', 'perf', 'refactor', 'revert', 'style', 'test', 'WIP-FIX'})
  vim.api.nvim_buf_del_keymap(0, 'n', 'i')
  return ''
end

vim.api.nvim_buf_set_keymap(0, 'n', 'i', 'i<C-r>=v:lua.conventional_commit_type()<CR>', { noremap = true })
vim.cmd('inoreabbrev <buffer> BB BREAKING CHANGE:')
