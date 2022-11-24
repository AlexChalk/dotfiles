-----------------------------------------------------
-- Clojure
-----------------------------------------------------
-- Clojure-parinfer
vim.api.nvim_set_keymap(
  "n",
  "<leader>lpp",
  ':let g:parinfer_mode = "paren"<cr>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>lpi",
  ':let g:parinfer_mode = "indent"<cr>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>lps",
  ':let g:parinfer_mode = "smart"<cr>',
  { noremap = true }
)

local clojureparinfer = vim.api.nvim_create_augroup(
  "clojureparinfer",
  { clear = true }
)
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "zipfile:*/*" },
  command = "setlocal nomodifiable",
  group = clojureparinfer,
})

-- Indentation settings
-- vim.g.clojure_fuzzy_indent = 2
-- vim.g.clojure_fuzzy_indent_patterns = {'.*'}
-- vim.g.clojure_fuzzy_indent_blacklist = {'->', ':require'}

-- Rainbow Parens
-- vim.g["rainbow#blacklist"] = {233, 234} ansi or HEX
local rainbow_lisp = vim.api.nvim_create_augroup("rainbow_lisp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lisp", "elisp", "racket", "clojure", "scheme" },
  command = "RainbowParentheses",
  group = rainbow_lisp,
})

-- Autopairs
vim.g.sexp_enable_insert_mode_mappings = 0
vim.g.sexp_mappings = {
  sexp_outer_list = "af",
  sexp_inner_list = "if",
  sexp_outer_top_list = "aF",
  sexp_inner_top_list = "iF",
  sexp_outer_string = "as", -- (doesn't seem to work, a") (unbound + paredit conflict)
  sexp_inner_string = "is", -- (doesn't seem to work, i") (unbound + paredit conflict)
  sexp_outer_element = "ae",
  sexp_inner_element = "ie",
  sexp_move_to_prev_bracket = "(",
  sexp_move_to_next_bracket = ")",
  sexp_move_to_prev_element_head = "B",  -- B with tpope plugin
  sexp_move_to_next_element_head = "W",  -- W with tpope plugin
  sexp_move_to_prev_element_tail = "gE", -- gE with tpope plugin
  sexp_move_to_next_element_tail = "E",  -- E with tpope plugin
  sexp_flow_to_prev_close = "<LocalLeader>[",
  sexp_flow_to_next_open = "<LocalLeader>]",
  sexp_flow_to_prev_open = "<LocalLeader>{",
  sexp_flow_to_next_close = "<LocalLeader>}",
  sexp_flow_to_prev_leaf_head = "<LocalLeader><LocalLeader>b",
  sexp_flow_to_next_leaf_head = "<LocalLeader><LocalLeader>w",
  sexp_flow_to_prev_leaf_tail = "<LocalLeader><LocalLeader>ge",
  sexp_flow_to_next_leaf_tail = "<LocalLeader><LocalLeader>e",
  sexp_move_to_prev_top_element = "[[",
  sexp_move_to_next_top_element = "]]",
  sexp_select_prev_element = "[e",
  sexp_select_next_element = "]e",
  sexp_indent = "==",
  sexp_indent_top = "=-",
  sexp_round_head_wrap_list = "sf(",
  sexp_round_tail_wrap_list = "sf)",
  sexp_square_head_wrap_list = "sf[",
  sexp_square_tail_wrap_list = "sf]",
  sexp_curly_head_wrap_list = "sf{",
  sexp_curly_tail_wrap_list = "sf}",
  sexp_round_head_wrap_element = "se(",
  sexp_round_tail_wrap_element = "se)",
  sexp_square_head_wrap_element = "se[",
  sexp_square_tail_wrap_element = "se]",
  sexp_curly_head_wrap_element = "se{",
  sexp_curly_tail_wrap_element = "se}",
  sexp_insert_at_list_head = "<I",
  sexp_insert_at_list_tail = ">I",
  sexp_splice_list = "<LocalLeader>@",
  sexp_convolute = "<LocalLeader>?",
  sexp_raise_list = "<LocalLeader><LocalLeader>o",
  sexp_raise_element = "<LocalLeader><LocalLeader>O",
  sexp_swap_list_backward = "<f",
  sexp_swap_list_forward = ">f",
  sexp_swap_element_backward = "<e",
  sexp_swap_element_forward = ">e",
  sexp_emit_head_element = ">(",
  sexp_emit_tail_element = "<)",
  sexp_capture_prev_element = "<(",
  sexp_capture_next_element = ">)",
}

-- Keywords
-- local clojure_keyword = vim.api.nvim_create_augroup(
--   "clojure_keyword",
--   { clear = true }
-- )
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "clojure" },
--   command = "setlocal iskeyword-=?,*,!,+,/,=,<,>,.,:,$",
--   group = clojure_keyword,
-- })

vim.cmd([=[
let s:fts_balancing_all_brackets = '.*\(clojure\|hy\|scheme\|racket\|shen\|lfe\|fennel\|janet\).*'
" Add paredit keybindings
function! PareditMapKeysCustom()
    inoremap <buffer> <expr>   (            PareditInsertOpening('(',')')
    inoremap <buffer> <silent> )            <C-R>=PareditInsertClosing('(',')')<CR>
    inoremap <buffer> <expr>   "            PareditInsertQuotes()
    inoremap <buffer> <expr>   <BS>         PareditBackspace(0)
    inoremap <buffer> <expr>   <C-h>        PareditBackspace(0)
    inoremap <buffer> <expr>   <Del>        PareditDel()

    " Work better than vim-sexp bindings
    noremap  <buffer> <silent> [[           :<C-U>call PareditFindDefunBck()<CR>
    noremap  <buffer> <silent> ]]           :<C-U>call PareditFindDefunFwd()<CR>

    call RepeatableNNoRemap('x', ':<C-U>call PareditEraseFwd()')
    nnoremap <buffer> <silent> <Del>        :<C-U>call PareditEraseFwd()<CR>
    call RepeatableNNoRemap('X', ':<C-U>call PareditEraseBck()')
    nnoremap <buffer> <silent> s            :<C-U>call PareditEraseFwd()<CR>i
    call RepeatableNNoRemap('D', 'v$:<C-U>call PareditDelete(visualmode(),1)')
    nnoremap <buffer> <silent> C            v$:<C-U>call PareditChange(visualmode(),1)<CR>
    nnoremap <buffer> <silent> d            :<C-U>call PareditSetDelete(v:count)<CR>g@
    vnoremap <buffer> <silent> d            :<C-U>call PareditDelete(visualmode(),1)<CR>
    vnoremap <buffer> <silent> x            :<C-U>call PareditDelete(visualmode(),1)<CR>
    vnoremap <buffer> <silent> <Del>        :<C-U>call PareditDelete(visualmode(),1)<CR>
    nnoremap <buffer> <silent> c            :set opfunc=PareditChange<CR>g@
    vnoremap <buffer> <silent> c            :<C-U>call PareditChange(visualmode(),1)<CR>
    call RepeatableNNoRemap('dd', ':<C-U>call PareditDeleteLines()')
    nnoremap <buffer> <silent> cc           :<C-U>call PareditChangeLines()<CR>
    nnoremap <buffer> <silent> cw           :<C-U>call PareditChangeSpec('cw',1)<CR>
    nnoremap <buffer> <silent> cW           :set opfunc=PareditChange<CR>g@E
    nnoremap <buffer> <silent> cb           :<C-U>call PareditChangeSpec('cb',0)<CR>
    nnoremap <buffer> <silent> ciw          :<C-U>call PareditChangeSpec('ciw',1)<CR>
    nnoremap <buffer> <silent> caw          :<C-U>call PareditChangeSpec('caw',1)<CR>
    nnoremap <buffer> <silent> do           do
    nnoremap <buffer> <silent> dp           dp
    call RepeatableNNoRemap('p', ':<C-U>call PareditPut("p")')
    call RepeatableNNoRemap('P', ':<C-U>call PareditPut("P")')
    call RepeatableNNoRemap(g:paredit_leader . 'w(', ':<C-U>call PareditWrap("(",")")')
    execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'w(  :<C-U>call PareditWrapSelection("(",")")<CR>'
    call RepeatableNNoRemap(g:paredit_leader . 'w"', ':<C-U>call PareditWrap('."'".'"'."','".'"'."')")
    execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'w"  :<C-U>call PareditWrapSelection('."'".'"'."','".'"'."')<CR>"
    " Splice s-expression killing backward/forward
    execute 'nmap     <buffer> <silent> ' . g:paredit_leader.'<Up>    d[(:<C-U>call PareditSplice()<CR>'
    execute 'nmap     <buffer> <silent> ' . g:paredit_leader.'<Down>  d])%:<C-U>call PareditSplice()<CR>'
    call RepeatableNNoRemap(g:paredit_leader . 'I', ':<C-U>call PareditRaise()')
    if &ft =~ s:fts_balancing_all_brackets
        inoremap <buffer> <expr>   [            PareditInsertOpening('[',']')
        inoremap <buffer> <silent> ]            <C-R>=PareditInsertClosing('[',']')<CR>
        inoremap <buffer> <expr>   {            PareditInsertOpening('{','}')
        inoremap <buffer> <silent> }            <C-R>=PareditInsertClosing('{','}')<CR>
        call RepeatableNNoRemap(g:paredit_leader . 'w[', ':<C-U>call PareditWrap("[","]")')
        execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'w[  :<C-U>call PareditWrapSelection("[","]")<CR>'
        call RepeatableNNoRemap(g:paredit_leader . 'w{', ':<C-U>call PareditWrap("{","}")')
        execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'w{  :<C-U>call PareditWrapSelection("{","}")<CR>'
    endif

    if g:paredit_shortmaps
        " Shorter keymaps: old functionality of KEY is remapped to <Leader>KEY
        call RepeatableNNoRemap('<', ':<C-U>call PareditMoveLeft()') 
        call RepeatableNNoRemap('>', ':<C-U>call PareditMoveRight()') 
        call RepeatableNNoRemap('O', ':<C-U>call PareditSplit()') 
        call RepeatableNNoRemap('J', ':<C-U>call PareditJoin()') 
        call RepeatableNNoRemap('W', ':<C-U>call PareditWrap("(",")")') 
        vnoremap <buffer> <silent> W            :<C-U>call PareditWrapSelection('(',')')<CR>
        call RepeatableNNoRemap('S', ':<C-U>call PareditSplice()') 
        execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'<  :<C-U>normal! <<CR>'
        execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'>  :<C-U>normal! ><CR>'
        execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'O  :<C-U>normal! O<CR>'
        execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'J  :<C-U>normal! J<CR>'
        execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'W  :<C-U>normal! W<CR>'
        execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'W  :<C-U>normal! W<CR>'
        execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'S  :<C-U>normal! S<CR>'
    else
        " Longer keymaps with <Leader> prefix
        nnoremap <buffer> <silent> S            V:<C-U>call PareditChange(visualmode(),1)<CR>
        call RepeatableNNoRemap(g:paredit_leader . '<', ':<C-U>call PareditMoveLeft()') 
        call RepeatableNNoRemap(g:paredit_leader . '>', ':<C-U>call PareditMoveRight()') 
        call RepeatableNNoRemap(g:paredit_leader . 'O', ':<C-U>call PareditSplit()') 
        call RepeatableNNoRemap(g:paredit_leader . 'J', ':<C-U>call PareditJoin()') 
        call RepeatableNNoRemap(g:paredit_leader . 'W', ':<C-U>call PareditWrap("(",")")') 
        execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'W  :<C-U>call PareditWrapSelection("(",")")<CR>'
        call RepeatableNNoRemap(g:paredit_leader . 'S', ':<C-U>call PareditSplice()') 
    endif

    if !exists( 'g:slimv_loaded' )
        execute 'nnoremap <buffer> <silent> ' . g:paredit_leader.'(  :<C-U>call PareditToggle()<CR>'
    endif

    if g:paredit_electric_return && mapcheck( "<CR>", "i" ) == ""
        " Do not override any possible mapping for <Enter>
        inoremap <buffer> <expr>   <CR>         PareditEnter()
    endif
endfunction

" Remove paredit keybindings
function! PareditUnmapKeysCustom()
    silent! iunmap <buffer> (
    silent! iunmap <buffer> )
    silent! iunmap <buffer> "
    silent! iunmap <buffer> <BS>
    silent! iunmap <buffer> <C-h>
    silent! iunmap <buffer> <Del>
    silent! unmap  <buffer> (
    silent! unmap  <buffer> )
    silent! unmap  <buffer> [[
    silent! unmap  <buffer> ]]
    silent! unmap  <buffer> x
    silent! unmap  <buffer> <Del>
    silent! unmap  <buffer> X
    silent! unmap  <buffer> s
    silent! unmap  <buffer> S
    silent! unmap  <buffer> p
    silent! unmap  <buffer> P
    silent! unmap  <buffer> D
    silent! unmap  <buffer> C
    silent! unmap  <buffer> d
    silent! unmap  <buffer> c
    silent! unmap  <buffer> dd
    silent! unmap  <buffer> do
    silent! unmap  <buffer> dp
    silent! unmap  <buffer> cc
    silent! unmap  <buffer> cw
    silent! unmap  <buffer> cW
    silent! unmap  <buffer> cb
    silent! unmap  <buffer> ciw
    silent! unmap  <buffer> caw
    if &ft =~ s:fts_balancing_all_brackets
        silent! iunmap <buffer> [
        silent! iunmap <buffer> ]
        silent! iunmap <buffer> {
        silent! iunmap <buffer> }
    endif
    if mapcheck( "<CR>", "i" ) == "PareditEnter()"
        " Remove only if we have added this mapping
        silent! iunmap <buffer> <CR>
    endif
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'w('
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'w['
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'w{'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'w"'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'w'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . '<Up>'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . '<Down>'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'I'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . '<'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . '>'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'O'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'J'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'W'
    silent! execute 'unmap  <buffer> ' . g:paredit_leader . 'S'
endfunction

let g:paredit_map_func = 'PareditMapKeysCustom'
let g:paredit_unmap_func = 'PareditUnmapKeysCustom'
]=])
