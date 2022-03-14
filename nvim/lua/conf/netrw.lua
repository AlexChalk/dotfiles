-----------------------------------------------------
-- netrw
-----------------------------------------------------

-- Open nerdtree equivalent
vim.api.nvim_set_keymap("n", "<Leader>pf", ":Explore<CR>", { noremap = true })

-- Tweaks for browsing
vim.g.netrw_banner = 0 -- disable annoying banner
vim.g.netrw_browse_split = 0 -- open in netrw window
vim.g.netrw_altv = 1 -- open splits to the right
vim.g.netrw_liststyle = 3 -- tree view
vim.g.netrw_list_hide = [[,\(^\|\s\s\)\zs\.\S\+]]

-- - <CR>/v/t to open in an h-split/v-split/tab
-- - check |netrw-browse-maps| for more mappings
