-----------------------------------------------------------------
-- Fugitive and Git
-----------------------------------------------------------------

-- :1:%            The current file's common ancestor during a conflict
-- :2:#            The alternate file in the target branch during a conflict
-- :3:#5           The file from buffer #5 in the merged branch during a conflict

vim.opt.tags:prepend("./.git/tags;")

-- Adding/removing/viewing/splitting

vim.api.nvim_set_keymap("n", "<leader>gcc", ":Git commit<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gcof", ":Gread<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gaf", ":Gwrite<cr>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>guf",
  ":silent exec '!git unstage %'<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gaa",
  ":silent exec '!git aa'<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gat",
  ":silent exec '!git add --intent-to-add .'<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gua",
  ":silent exec '!git unstage .'<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>go<space>",
  ":Gedit<space>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gdf<space>",
  ":Gvdiff<space>",
  { noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>gdfs", ":Gvdiffsplit!<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gdfc", ":Gvdiff<cr>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>gdfm",
  ":Gvdiff master:%<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gs<space>",
  ":Gvsplit<space>",
  { noremap = true }
)

-- Logging/searching
-- If history is long commands take limit argument, e.g. :0Gclog -10<cr>

vim.api.nvim_set_keymap("n", "<leader>glf", ":Gclog -- %<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gfh", ":0Gclog<cr>", { noremap = true })
-- To search on other branches: Ggrep 'text' branch
vim.api.nvim_set_keymap("n", "<leader>gg", ":Ggrep", { noremap = true })
-- To search commit messages for text: Gclog --grep=text --
vim.api.nvim_set_keymap(
  "n",
  "<leader>gscm",
  ":Gclog --grep= --<left><left><left>",
  { noremap = true }
)
-- To search for text added or removed by commit: Gclog -Stext --
vim.api.nvim_set_keymap(
  "n",
  "<leader>gscf",
  ":Gclog -S --<left><left><left>",
  { noremap = true }
)

-- Diffing
-- [c — jump to previous change hunk
-- ]c — jump to next change hunk

-- Two-way diffing
vim.api.nvim_set_keymap(
  "x",
  "<leader>gsph",
  ":diffput | diffupdate<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "x",
  "<leader>gsh",
  ":diffget | diffupdate<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gsph",
  ":diffput | diffupdate<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gsh",
  ":diffget | diffupdate<cr>",
  { noremap = true }
)

-- Three-way diffing (merge conflicts)

-- No visual-line mappings for diffget, because fugitive isn't smart
-- enough to correctly diffget partial hunks in a merge conflict.
vim.api.nvim_set_keymap(
  "x",
  "<leader>gsch",
  ":diffput 1 | diffupdate<cr>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>gsfh",
  ":diffget //3 | diffupdate<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gsmh",
  ":diffget //2 | diffupdate<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gsch",
  ":diffput 1 | diffupdate<cr>",
  { noremap = true }
)

-- Viewing commits
-- - to go to parent commit
-- <cr> on tree to view filesystem
-- <cr> for subdir, - for parent dir
-- C to go back to commit when in tree
-- a to toggle view type
vim.api.nvim_set_keymap("n", "<leader>glm", ":Gedit HEAD^{}<cr>", { noremap = true })

-- Praise
-- o to open commit in split O for tab, g? to see other options
vim.api.nvim_set_keymap("n", "<leader>gp", ":Git blame<cr>", { noremap = true })

-- Status
-- <CR> edit
-- o open in split
-- S open in vsplit
-- U checkout
-- g? other options
vim.api.nvim_set_keymap("n", "<leader>gss", ":Git<cr>", { noremap = true })
-- Browse in github
vim.api.nvim_set_keymap("n", "<leader>gb", ":GBrowse<cr>", { noremap = true })
vim.api.nvim_set_keymap("x", "<leader>gb", ":GBrowse<cr>", { noremap = true })

-- Review a PR
vim.api.nvim_set_keymap(
  "n",
  "<leader>grpm",
  ":Git --paginate request-pull -p master ./<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>grp<space>",
  ":Git --paginate request-pull -p  ./<left><left><left>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gdfh",
  ":Git --paginate diff HEAD<cr>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gdfu<space>",
  ":Git --paginate diff<space>",
  { noremap = true }
)

-- Nothing, --cached, or HEAD

-- Fix line length on commit messages: gqip
