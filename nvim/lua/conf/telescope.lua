local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        height = 0.8,
        preview_cutoff = 120,
        prompt_position = "bottom",
        width = 0.99,
      },
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-u>"] = false,
        ["<C-h>"] = "which_key",
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      -- the default case_mode is "smart_case"
    },
  },
})
require("telescope").load_extension("fzf")

vim.api.nvim_set_keymap(
  "n",
  "<c-p>",
  "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--follow,--files<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader><c-p>",
  [[<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--follow,--glob,!.git/*,--files<cr>]],
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fh",
  "<cmd>Telescope help_tags<cr>",
  { noremap = true }
)
