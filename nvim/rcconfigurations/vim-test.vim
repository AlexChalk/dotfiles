""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-test setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = 'vtr'
let test#javascript#jasmine#file_pattern = '\.test\.js'
let test#javascript#mocha#file_pattern = '\vtests?/.*\.(ts|js|jsx|coffee)$'

let g:test#javascript#mocha#options = '--require ts-node/register'

function! MochaBabel()
  let g:test#javascript#mocha#options = '--require @babel/register'
endfunc
command! MochaBabel :call MochaBabel()

function! MochaTypescript()
  let g:test#javascript#mocha#options = '--require ts-node/register'
endfunc
command! MochaTypescript :call MochaTypescript()

function! MochaVanilla()
  let g:test#javascript#mocha#options = ''
endfunc
command! MochaVanilla :call MochaVanilla()

" Run Test Assertion/File/Suite/Repeat
nmap <silent> <leader>abt :MochaBabel<CR>
nmap <silent> <leader>att :MochaTypescript<CR>
nmap <silent> <leader>ajt :MochaVanilla<CR>

nmap <silent> <leader>rta :TestNearest<CR>
nmap <silent> <leader>rtf :TestFile<CR>
nmap <silent> <leader>rts :TestSuite<CR>
nmap <silent> <leader>rtr :TestLast<CR>
