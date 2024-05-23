-----------------------------------------------------
-- Clojure
-----------------------------------------------------
local rainbow_delimiters = require("rainbow-delimiters")
vim.g.rainbow_delimiters = {
  strategy = {
    [""] = rainbow_delimiters.strategy["noop"],
    lisp = rainbow_delimiters.strategy["global"],
    elisp = rainbow_delimiters.strategy["global"],
    racket = rainbow_delimiters.strategy["global"],
    clojure = rainbow_delimiters.strategy["global"],
    scheme = rainbow_delimiters.strategy["global"],
  },
}

-- Readonly zip files (source code)
local nozipmod = vim.api.nvim_create_augroup("nozipmod", { clear = true })
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "zipfile:*/*" },
  command = "setlocal nomodifiable",
  group = nozipmod,
})

-- Autopairs
vim.g.sexp_enable_insert_mode_mappings = true
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
  sexp_move_to_prev_bracket = "<localleader>[",
  sexp_move_to_next_bracket = "<localleader>]",
  sexp_move_to_prev_element_head = "<localleader>B", -- B with tpope plugin
  sexp_move_to_next_element_head = "<localleader>W", -- W with tpope plugin
  sexp_move_to_prev_element_tail = "<localleader>gE", -- gE with tpope plugin
  sexp_move_to_next_element_tail = "<localleader>E", -- E with tpope plugin
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
  sexp_splice_list = "<LocalLeader>@",
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

  -- no analogous nvim-paredit mapping
  sexp_flow_to_next_open = "{",
  sexp_flow_to_prev_close = "}",
  sexp_flow_to_prev_open = "(",
  sexp_flow_to_next_close = ")",
  sexp_flow_to_prev_leaf_head = "B",
  sexp_flow_to_next_leaf_head = "W",
  sexp_flow_to_prev_leaf_tail = "gE",
  sexp_flow_to_next_leaf_tail = "E",
  sexp_move_to_prev_top_element = "[[",
  sexp_move_to_next_top_element = "]]",
  sexp_select_prev_element = "[e",
  sexp_select_next_element = "]e",
  sexp_indent = "==",
  sexp_indent_top = "=-",
  sexp_insert_at_list_head = "<I",
  sexp_insert_at_list_tail = ">I",
  sexp_convolute = "<LocalLeader>?",
}
