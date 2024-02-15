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

-- local paredit = require("nvim-paredit")
-- paredit.setup({
--   -- should plugin use default keybindings? (default = true)
--   use_default_keys = true,
--   -- sometimes user wants to restrict plugin to certain file types only
--   -- defaults to all supported file types including custom lang
--   -- extensions (see next section)
--   filetypes = { "clojure" },

--   -- This controls where the cursor is placed when performing slurp/barf operations
--   --
--   -- - "remain" - It will never change the cursor position, keeping it in the same place
--   -- - "follow" - It will always place the cursor on the form edge that was moved
--   -- - "auto"   - A combination of remain and follow, it will try keep the cursor in the original position
--   --              unless doing so would result in the cursor no longer being within the original form. In
--   --              this case it will place the cursor on the moved edge
--   cursor_behaviour = "auto", -- remain, follow, auto

--   indent = {
--     -- This controls how nvim-paredit handles indentation when performing operations which
--     -- should change the indentation of the form (such as when slurping or barfing).
--     --
--     -- When set to true then it will attempt to fix the indentation of nodes operated on.
--     enabled = false,
--     -- A function that will be called after a slurp/barf if you want to provide a custom indentation
--     -- implementation.
--     indentor = require("nvim-paredit.indentation.native").indentor,
--   },

--   -- list of default keybindings
--   keys = {
--     ["<localleader>@"] = { paredit.unwrap.unwrap_form_under_cursor, "Splice sexp" },
--     [">)"] = { paredit.api.slurp_forwards, "Slurp forwards" },
--     [">("] = { paredit.api.barf_backwards, "Barf backwards" },

--     ["<)"] = { paredit.api.barf_forwards, "Barf forwards" },
--     ["<("] = { paredit.api.slurp_backwards, "Slurp backwards" },

--     [">e"] = { paredit.api.drag_element_forwards, "Drag element right" },
--     ["<e"] = { paredit.api.drag_element_backwards, "Drag element left" },

--     [">f"] = { paredit.api.drag_form_forwards, "Drag form right" },
--     ["<f"] = { paredit.api.drag_form_backwards, "Drag form left" },

--     ["<localleader>o"] = { paredit.api.raise_form, "Raise form" },
--     ["<localleader>O"] = { paredit.api.raise_element, "Raise element" },

--     ["E"] = {
--       paredit.api.move_to_next_element_tail,
--       "Jump to next element tail",
--       -- by default all keybindings are dot repeatable
--       repeatable = false,
--       mode = { "n", "x", "o", "v" },
--     },
--     ["W"] = {
--       paredit.api.move_to_next_element_head,
--       "Jump to next element head",
--       repeatable = false,
--       mode = { "n", "x", "o", "v" },
--     },

--     ["B"] = {
--       paredit.api.move_to_prev_element_head,
--       "Jump to previous element head",
--       repeatable = false,
--       mode = { "n", "x", "o", "v" },
--     },
--     ["gE"] = {
--       paredit.api.move_to_prev_element_tail,
--       "Jump to previous element tail",
--       repeatable = false,
--       mode = { "n", "x", "o", "v" },
--     },

--     ["("] = {
--       paredit.api.move_to_parent_form_start,
--       "Jump to parent form's head",
--       repeatable = false,
--       mode = { "n", "x", "v" },
--     },
--     [")"] = {
--       paredit.api.move_to_parent_form_end,
--       "Jump to parent form's tail",
--       repeatable = false,
--       mode = { "n", "x", "v" },
--     },

--     -- These are text object selection keybindings which can used with standard `d, y, c`, `v`
--     ["af"] = {
--       paredit.api.select_around_form,
--       "Around form",
--       repeatable = false,
--       mode = { "o", "v" }
--     },
--     ["if"] = {
--       paredit.api.select_in_form,
--       "In form",
--       repeatable = false,
--       mode = { "o", "v" }
--     },
--     ["aF"] = {
--       paredit.api.select_around_top_level_form,
--       "Around top level form",
--       repeatable = false,
--       mode = { "o", "v" }
--     },
--     ["iF"] = {
--       paredit.api.select_in_top_level_form,
--       "In top level form",
--       repeatable = false,
--       mode = { "o", "v" }
--     },
--     ["ae"] = {
--       paredit.api.select_element,
--       "Around element",
--       repeatable = false,
--       mode = { "o", "v" },
--     },
--     ["ie"] = {
--       paredit.api.select_element,
--       "Element",
--       repeatable = false,
--       mode = { "o", "v" },
--     },
--   }
-- })
