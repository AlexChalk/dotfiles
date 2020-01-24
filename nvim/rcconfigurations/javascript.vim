" Use JSX highlighting in js files too
let g:jsx_ext_required = 0

let g:javascript_plugin_jsdoc = 1

nnoremap <leader>cls ^iconsole.log('>>>', JSON.stringify(<esc>A, null, 4));<esc>

function JsFix()
  call CocAction('format')
  execute 'CocCommand' 'eslint.executeAutofix'
endfunction

augroup js-fix
  autocmd!
  " command! -nargs=0 Prettier :CocCommand prettier.formatFile<CR>
  " command! -nargs=0 Eslint :CocCommand prettier.formatFile<CR>
  autocmd FileType javascript nnoremap <Leader>fl :call JsFix()<CR>
  autocmd FileType typescript nnoremap <Leader>fl :call JsFix()<CR>
  " autocmd FileType typescript nnoremap <Leader>fl :CocCommand eslint.executeAutofix<CR>
augroup END

" Convert to arrow function:
" %s/function (\(.*\)) {/(\1) => {/gc
