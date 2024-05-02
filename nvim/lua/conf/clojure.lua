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
--     enabled = true,
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

--     ["<localleader><localleader>o"] = { paredit.api.raise_form, "Raise form" },
--     ["<localleader><localleader>O"] = { paredit.api.raise_element, "Raise element" },

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
--       mode = { "o", "v" },
--     },
--     ["if"] = {
--       paredit.api.select_in_form,
--       "In form",
--       repeatable = false,
--       mode = { "o", "v" },
--     },
--     ["aF"] = {
--       paredit.api.select_around_top_level_form,
--       "Around top level form",
--       repeatable = false,
--       mode = { "o", "v" },
--     },
--     ["iF"] = {
--       paredit.api.select_in_top_level_form,
--       "In top level form",
--       repeatable = false,
--       mode = { "o", "v" },
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

--     ["se("] = {
--       function()
--         -- place cursor and set mode to `insert`
--         paredit.cursor.place_cursor(
--           -- wrap element under cursor with `( ` and `)`
--           paredit.wrap.wrap_element_under_cursor("( ", ")"),
--           -- cursor placement opts
--           { placement = "inner_start", mode = "insert" }
--         )
--       end,
--       "Wrap element insert head ()",
--     },
--     ["se)"] = {
--       function()
--         paredit.cursor.place_cursor(
--           paredit.wrap.wrap_element_under_cursor("(", ")"),
--           { placement = "inner_end", mode = "insert" }
--         )
--       end,
--       "Wrap element insert tail ()",
--     },
--     ["sf("] = {
--       function()
--         paredit.cursor.place_cursor(
--           paredit.wrap.wrap_enclosing_form_under_cursor("( ", ")"),
--           { placement = "inner_start", mode = "insert" }
--         )
--       end,
--       "Wrap form insert head ()",
--     },
--     ["sf)"] = {
--       function()
--         paredit.cursor.place_cursor(
--           paredit.wrap.wrap_enclosing_form_under_cursor("(", ")"),
--           { placement = "inner_end", mode = "insert" }
--         )
--       end,
--       "Wrap form insert tail ()",
--     },

--     ["se{"] = {
--       function()
--         -- place cursor and set mode to `insert`
--         paredit.cursor.place_cursor(
--           -- wrap element under cursor with `( ` and `)`
--           paredit.wrap.wrap_element_under_cursor("{ ", "}"),
--           -- cursor placement opts
--           { placement = "inner_start", mode = "insert" }
--         )
--       end,
--       "Wrap element insert head {}",
--     },
--     ["se}"] = {
--       function()
--         paredit.cursor.place_cursor(
--           paredit.wrap.wrap_element_under_cursor("{", "}"),
--           { placement = "inner_end", mode = "insert" }
--         )
--       end,
--       "Wrap element insert tail {}",
--     },
--     ["sf{"] = {
--       function()
--         paredit.cursor.place_cursor(
--           paredit.wrap.wrap_enclosing_form_under_cursor("{ ", "}"),
--           { placement = "inner_start", mode = "insert" }
--         )
--       end,
--       "Wrap form insert head {}",
--     },
--     ["sf}"] = {
--       function()
--         paredit.cursor.place_cursor(
--           paredit.wrap.wrap_enclosing_form_under_cursor("{", "}"),
--           { placement = "inner_end", mode = "insert" }
--         )
--       end,
--       "Wrap form insert tail {}",
--     },

--     ["se["] = {
--       function()
--         -- place cursor and set mode to `insert`
--         paredit.cursor.place_cursor(
--           -- wrap element under cursor with `( ` and `)`
--           paredit.wrap.wrap_element_under_cursor("[ ", "]"),
--           -- cursor placement opts
--           { placement = "inner_start", mode = "insert" }
--         )
--       end,
--       "Wrap element insert head []",
--     },
--     ["se]"] = {
--       function()
--         paredit.cursor.place_cursor(
--           paredit.wrap.wrap_element_under_cursor("[", "]"),
--           { placement = "inner_end", mode = "insert" }
--         )
--       end,
--       "Wrap element insert tail []",
--     },
--     ["sf["] = {
--       function()
--         paredit.cursor.place_cursor(
--           paredit.wrap.wrap_enclosing_form_under_cursor("[ ", "]"),
--           { placement = "inner_start", mode = "insert" }
--         )
--       end,
--       "Wrap form insert head []",
--     },
--     ["sf]"] = {
--       function()
--         paredit.cursor.place_cursor(
--           paredit.wrap.wrap_enclosing_form_under_cursor("[", "]"),
--           { placement = "inner_end", mode = "insert" }
--         )
--       end,
--       "Wrap form insert tail []",
--     },
--   },
-- })
