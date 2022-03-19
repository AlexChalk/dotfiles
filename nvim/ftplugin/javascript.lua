-----------------------------------------------------
-- Javascript
-----------------------------------------------------

vim.g.jsx_ext_required = 0

vim.g.javascript_plugin_jsdoc = 1

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>cls",
  [[yiw^iconsole.log('>>><c-r>0', JSON.stringify(<esc>A, null, 4));<esc>]],
  { noremap = false }
)

-- Convert to arrow function:
-- %s/function (\(.*\)) {/(\1) => {/gc
