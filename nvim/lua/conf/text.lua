-- Redefine conflicting vim wiki binding
vim.g.vimwiki_map_prefix = "<Leader><Leader><Leader>w"
-- vim.g.vimwiki_list = {}
-- vim.g.riv_global_leader = '<Leader>ee'
-- vim.g.vimwiki_conceallevel = 1
-- vim.g.rst_fold_enabled=1

vim.g.vimwiki_key_mappings = {
  all_maps = 1,
  global = 1,
  headers = 1,
  text_objs = 1,
  table_format = 1,
  table_mappings = 1,
  lists = 1,
  links = 0,
  html = 1,
  mouse = 0,
}

vim.g.vimwiki_ext2syntax = { [".wiki"] = "default" }
vim.g.vimwiki_url_maxsave = 0

local wiki = vim.api.nvim_create_augroup("wiki", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
  pattern = { "vimwiki" },
  callback = function()
    vim.keymap.set({ "n" }, "<CR>", "o<ESC>", { remap = true, buffer = true })
    vim.keymap.set(
      { "n" },
      "#",
      "<Plug>VimwikiAddHeaderLevel",
      { remap = true, buffer = true }
    )
    vim.keymap.set(
      { "n" },
      "<C-]>",
      "<Plug>VimwikiFollowLink",
      { remap = true, buffer = true }
    )
    vim.keymap.set(
      { "n" },
      "<C-T>",
      "<Plug>VimwikiGoBackLink",
      { remap = true, buffer = true }
    )
  end,
  group = wiki,
})
