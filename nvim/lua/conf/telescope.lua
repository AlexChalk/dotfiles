local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Workaround for https://github.com/nvim-telescope/telescope.nvim/issues/1048
local multiopen = function(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if not num_selections or num_selections <= 1 then
    actions.add_selection(prompt_bufnr)
  end
  actions.send_selected_to_qflist(prompt_bufnr)

  local results = vim.fn.getqflist()

  for _, result in ipairs(results) do
    local current_file = vim.fn.bufname()
    local next_file = vim.fn.bufname(result.bufnr)

    if current_file == "" then
      vim.api.nvim_command("edit" .. " " .. next_file)
    else
      vim.api.nvim_command(open_cmd .. " " .. next_file)
    end
  end

  vim.api.nvim_command("cd .")
end

local function multi_selection_open_vsplit(prompt_bufnr)
  multiopen(prompt_bufnr, "vsplit")
end

local function multi_selection_open_split(prompt_bufnr)
  multiopen(prompt_bufnr, "split")
end

local function multi_selection_open_tab(prompt_bufnr)
  multiopen(prompt_bufnr, "tabedit")
end

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
        ["<C-e>"] = actions.close,
        ["<C-u>"] = false,
        ["<C-h>"] = "which_key",
      },
    },
  },
  pickers = {
    find_files = {
      mappings = {
        i = {
          ["<C-V>"] = multi_selection_open_vsplit,
          ["<C-X>"] = multi_selection_open_split,
          ["<C-T>"] = multi_selection_open_tab,
        },
      },
    },
    live_grep = {
      mappings = {
        i = {
          ["<C-V>"] = multi_selection_open_vsplit,
          ["<C-X>"] = multi_selection_open_split,
          ["<C-T>"] = multi_selection_open_tab,
        },
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
    bibtex = {
      -- Depth for the *.bib file
      depth = 1,
      -- Custom format for citation label
      custom_formats = {},
      -- Format to use for citation label.
      -- Try to match the filetype by default, or use 'plain'
      format = "",
      -- Path to global bibliographies (placed outside of the project)
      global_files = { vim.fn.expand("$HOME/Dropbox/papis/Zotero.bib") },
      -- Define the search keys to use in the picker
      search_keys = { "author", "year", "title" },
      -- Template for the formatted citation
      citation_format = "{{author}} ({{year}}), {{title}}.",
      -- Only use initials for the authors first name
      citation_trim_firstname = true,
      -- Max number of authors to write in the formatted citation
      -- following authors will be replaced by "et al."
      citation_max_auth = 2,
      -- Context awareness disabled by default
      context = false,
      -- Fallback to global/directory .bib files if context not found
      -- This setting has no effect if context = false
      context_fallback = true,
      -- Wrapping in the preview window is disabled by default
      wrap = false,
    },
  },
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("bibtex")

vim.keymap.set(
  { "i", "n", "s", "x" },
  "<leader>pz",
  "<cmd>Telescope bibtex format=plain<cr>",
  {}
)

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
  "<leader>rg",
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

vim.api.nvim_create_user_command("Rg", "Telescope live_grep", { nargs = 0 })
SetupCommandAlias("rg", "Rg")
