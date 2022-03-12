" Use JSX highlighting in js files too
let g:jsx_ext_required = 0

let g:javascript_plugin_jsdoc = 1

nnoremap <leader>cls yiw^iconsole.log('>>><c-r>0', JSON.stringify(<esc>A, null, 4));<esc>

" Convert to arrow function:
" %s/function (\(.*\)) {/(\1) => {/gc
