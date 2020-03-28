inoreabbrev <buffer> BB BREAKING CHANGE:
nnoremap    <buffer> i  i<C-r>=<sid>commit_type()<CR>

fun! s:commit_type()
  call complete(1, [ 'build', 'ci', 'chore', 'docs', 'feat', 'fix', 'perf', 'refactor', 'revert', 'style', 'test', 'WIP-FIX' ])
  nunmap <buffer> i
  return ''
endfun
