-----------------------------------------------------
-- Clojure
-----------------------------------------------------

-- Indentation settings
-- vim.g.clojure_fuzzy_indent = 2
-- vim.g.clojure_fuzzy_indent_patterns = {'.*'}
-- vim.g.clojure_fuzzy_indent_blacklist = {'->', ':require'}

-- Rainbow Parens
-- vim.g["rainbow#blacklist"] = {233, 234} ansi or HEX
-- PR for native lua: https://github.com/neovim/neovim/pull/14661
vim.cmd([[
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,elisp,racket,clojure,scheme RainbowParentheses
augroup END
]])

-- Autopairs
vim.g.sexp_enable_insert_mode_mappings = 0
vim.g.sexp_mappings = {
  sexp_outer_list = "zf",
  sexp_inner_list = "if",
  sexp_outer_top_list = "aF",
  sexp_inner_top_list = "iF",
  sexp_outer_string = "as",
  sexp_inner_string = "is",
  sexp_outer_element = "ae",
  sexp_inner_element = "ie",
  sexp_move_to_prev_bracket = "(",
  sexp_move_to_next_bracket = ")",
  sexp_move_to_prev_element_head = "<M-b>",
  sexp_move_to_next_element_head = "<M-w>",
  sexp_move_to_prev_element_tail = "g<M-e>",
  sexp_move_to_next_element_tail = "<M-e>",
  sexp_flow_to_prev_close = "<M-[>",
  sexp_flow_to_next_open = "<M-]>",
  sexp_flow_to_prev_open = "<M-{>",
  sexp_flow_to_next_close = "<M-}>",
  sexp_flow_to_prev_leaf_head = "<M-S-b>",
  sexp_flow_to_next_leaf_head = "<M-S-w>",
  sexp_flow_to_prev_leaf_tail = "<M-S-g>",
  sexp_flow_to_next_leaf_tail = "<M-S-e>",
  sexp_move_to_prev_top_element = "[[",
  sexp_move_to_next_top_element = "]]",
  sexp_select_prev_element = "[e",
  sexp_select_next_element = "]e",
  sexp_indent = "==",
  sexp_indent_top = "=-",
  sexp_round_head_wrap_list = "<LocalLeader>i",
  sexp_round_tail_wrap_list = "<LocalLeader>I",
  sexp_square_head_wrap_list = "<LocalLeader>[",
  sexp_square_tail_wrap_list = "<LocalLeader>]",
  sexp_curly_head_wrap_list = "<LocalLeader>{",
  sexp_curly_tail_wrap_list = "<LocalLeader>}",
  sexp_round_head_wrap_element = "<LocalLeader>w",
  sexp_round_tail_wrap_element = "<LocalLeader>W",
  sexp_square_head_wrap_element = "",
  sexp_square_tail_wrap_element = "",
  sexp_curly_head_wrap_element = "",
  sexp_curly_tail_wrap_element = "",
  sexp_insert_at_list_head = "<LocalLeader>h",
  sexp_insert_at_list_tail = "<LocalLeader>l",
  sexp_splice_list = "<LocalLeader>@",
  sexp_convolute = "<LocalLeader>?",
  sexp_raise_list = "<LocalLeader>o",
  sexp_raise_element = "<LocalLeader>O",
  sexp_swap_list_backward = "<M-k>",
  sexp_swap_list_forward = "<M-j>",
  sexp_swap_element_backward = "<M-h>",
  sexp_swap_element_forward = "<M-l>",
  sexp_emit_head_element = "<M-S-j>",
  sexp_emit_tail_element = "<M-S-k>",
  sexp_capture_prev_element = "<M-S-h>",
  sexp_capture_next_element = "<M-S-l>",
}

-- \ 'sexp_square_head_wrap_element':  '<LocalLeader>e[',
-- \ 'sexp_square_tail_wrap_element':  '<LocalLeader>e]',
-- \ 'sexp_curly_head_wrap_element':   '<LocalLeader>e{',
-- \ 'sexp_curly_tail_wrap_element':   '<LocalLeader>e}',

-- Keywords
-- PR for native lua: https://github.com/neovim/neovim/pull/14661
-- vim.cmd([[
-- augroup clojure-keyword
--   autocmd!
--   autocmd FileType clojure set iskeyword-=?,*,!,+,/,=,<,>,.,:,$
-- augroup END
-- ]])
