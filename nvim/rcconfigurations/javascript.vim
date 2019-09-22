" Use JSX highlighting in js files too
let g:jsx_ext_required = 0

let g:javascript_plugin_jsdoc = 1

nnoremap <leader>cls ^iconsole.log('>>>', JSON.stringify(<esc>A, null, 4));<esc>

augroup js-fix
  autocmd!
  autocmd FileType javascript nnoremap <Leader>fl :CocCommand eslint.executeAutofix<CR>
  autocmd FileType typescript nnoremap <Leader>fl :CocCommand eslint.executeAutofix<CR>
augroup END

" Convert to arrow function:
" %s/function (\(.*\)) {/(\1) => {/gc
