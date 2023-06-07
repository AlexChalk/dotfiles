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

local clojureparinfer =
  vim.api.nvim_create_augroup("clojureparinfer", { clear = true })
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
vim.g.sexp_insert_after_wrap = true
vim.g.sexp_mappings = {
  sexp_outer_list = "af",
  sexp_inner_list = "if",
  sexp_outer_top_list = "aF",
  sexp_inner_top_list = "iF",
  sexp_outer_string = "as",
  sexp_inner_string = "is",
  sexp_outer_element = "ae",
  sexp_inner_element = "ie",
  sexp_move_to_prev_bracket = "(",
  sexp_move_to_next_bracket = ")",
  sexp_move_to_prev_element_head = "B", -- B with tpope plugin
  sexp_move_to_next_element_head = "W", -- W with tpope plugin
  sexp_move_to_prev_element_tail = "gE", -- gE with tpope plugin
  sexp_move_to_next_element_tail = "E", -- E with tpope plugin
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

vim.g.paredit_smartjump = true


-- Extra sexp-for-regular-people mappings:
-- dsf:                splice (delete surroundings of form)
-- cse( / cse) / cseb: surround element in parentheses
-- cse[ / cse]:        surround element in brackets
-- cse{ / cse}:        surround element in braces

-- Extra paredit mappings:
-- <Leader><      Smart leftwards slurp/barf
-- <Leader>>      Smart rightwards slurp/barf

-- <Leader>J      Join two subsequent lists or strings.
-- <Leader>O      Split ("Open") current list or string at the cursor position. Opposite of Join.
-- <Leader>W / <Leader>w(     Wrap the current symbol in a pair of parentheses.
-- <Leader>w[     Wrap the current symbol in a pair of square brackets.
-- <Leader>w{     Wrap the current symbol in a pair of curly braces.
-- <Leader>w"     Wrap the current symbol in a pair of double quotes.

-- <Leader>S      Splice the current list into the containing list.
-- <Leader><Up>   Splice the current list into the containing list by deleting
--                everything backward from the cursor position up to the
--                opening paren. (Calls `d[(` before splicing)

-- <Leader><Down> Splice the current list into the containing list by deleting
--                everything forward from the cursor position up to the
--                closing paren. (Calls `d])%` before splicing)

-- <Leader>I      Raise the current symbol.

-- Leader removed from these keys when g.paredit_shortmaps is nonzero: <, >, J, O, W, S
