-----------------------------------------------------
-- Clojure
-----------------------------------------------------

local no_repl_lsp_analysis =
  vim.api.nvim_create_augroup("no_repl_lsp_analysis", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "conjure-log-*" },
  command = "lua vim.diagnostic.disable(0)",
  group = no_repl_lsp_analysis,
})

vim.keymap.set(
  { "n" },
  "<leader>lar",
  ":ConjureEval (user/restart)<CR>",
  { remap = true }
)

--Conjure
vim.g["conjure#client#clojure#nrepl#eval#print_options#level"] = false
vim.g["conjure#client#clojure#nrepl#eval#print_options#length"] = 500

vim.g["conjure#mapping#prefix"] = "<localleader>l"
vim.g["conjure#mapping#prefix"] = "<localleader>l"
vim.g["conjure#eval#result_register"] = "c"
vim.g["conjure#eval#result_register"] = 1
vim.g["conjure#eval#comment_prefix"] = ";; "
vim.g["conjure#eval#gsubs"] = {
  ["do-comment"] = { "^%(comment[%s%c]", "(do " },
  -- ["do-comment-single"] = { "^;;.", "" },
}
vim.g["conjure#mapping#log_split"] = "ls"
vim.g["conjure#mapping#log_vsplit"] = "lv"
vim.g["conjure#mapping#log_tab"] = "lt"
vim.g["conjure#mapping#log_reset_soft"] = "lr"
vim.g["conjure#mapping#log_reset_hard"] = "lhr"
vim.g["conjure#mapping#log_close_visible"] = "lq"
vim.g["conjure#mapping#eval_current_form"] = "ee"
vim.g["conjure#mapping#eval_comment_current_form"] = "ece"
vim.g["conjure#mapping#eval_root_form"] = "er"
vim.g["conjure#mapping#eval_comment_root_form"] = "ecr"
vim.g["conjure#mapping#eval_word"] = "ew"
vim.g["conjure#mapping#eval_comment_word"] = "ecw"
vim.g["conjure#mapping#eval_replace_form"] = "e!"
vim.g["conjure#mapping#eval_marked_form"] = "em"
vim.g["conjure#mapping#eval_comment_form"] = "ec"
vim.g["conjure#mapping#eval_file"] = "esf"
vim.g["conjure#mapping#eval_buf"] = "eb"
vim.g["conjure#mapping#eval_visual"] = "E"
vim.g["conjure#mapping#def_word"] = "gd"
vim.g["conjure#mapping#doc_word"] = { "K" }
vim.g["conjure#highlight#enabled"] = 1
vim.g["conjure#log#hud#width"] = 0.42
vim.g["conjure#log#hud#height"] = 0.4
vim.g["conjure#log#hud#enabled"] = 1
vim.g["conjure#log#hud#passive_close_delay"] = 10
vim.g["conjure#log#wrap"] = 1
vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
vim.g["conjure#client#clojure#nrepl#test#call_suffix"] =
  '{:kaocha/color? false, :config-file "tests.edn"}'
vim.g["conjure#client#clojure#nrepl#mapping#view_source"] = "vs"
vim.g["conjure#client#clojure#nrepl#mapping#run_all_tests"] = "ta"
vim.g["conjure#client#clojure#nrepl#mapping#run_current_ns_tests"] = "tn"
vim.g["conjure#client#clojure#nrepl#mapping#run_alternate_ns_tests"] = "tN"
vim.g["conjure#client#clojure#nrepl#mapping#run_current_test"] = "tc"
vim.g["conjure#client#clojure#nrepl#mapping#refresh_changed"] = "rr"
vim.g["conjure#client#clojure#nrepl#mapping#refresh_all"] = "ra"
vim.g["conjure#client#clojure#nrepl#mapping#refresh_clear"] = "rc"
-- vim.g['conjure#extract#tree_sitter#enabled'] = 1
