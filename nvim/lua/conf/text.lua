-- Redefine conflicting vim wiki binding
vim.g.vimwiki_map_prefix = "<Leader><Leader>w"
-- vim.g.vimwiki_list = {}
-- vim.g.riv_global_leader = '<Leader>ee'
-- vim.g.vimwiki_conceallevel = 1
-- vim.g.rst_fold_enabled=1
-- vim.g["pandoc#syntax#conceal#use"] = 0
vim.g["pandoc#modules#disabled"] = { "folding" }
vim.g["pandoc#filetypes#handled"] = { "pandoc", "rst" }
vim.g["pandoc#filetypes#pandoc_markdown"] = 1
-- vim.g["pandoc#syntax#conceal#blacklist"] = {"atx", "list"}
vim.g["pandoc#syntax#conceal#blacklist"] = { "list" }
vim.g["pandoc#keyboard#enabled_submodules"] = {
  "lists",
  "references",
  "styles",
  "sections",
  "links",
  "checkboxes",
}
vim.g["pandoc#spell#enabled"] = 0
-- vim.g.vimwiki_folding = 'list'
-- why the underlines in the file
-- vim.g["pandoc#syntax#conceal#urls"] = 1;
--g["pandoc#keyboard#sections#header_style"]
--g["pandoc#hypertext#open_cmd"]
--g["pandoc#toc#position"]

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

-- PR for native lua: https://github.com/neovim/neovim/pull/14661
vim.cmd([[
augroup wiki
  autocmd!
  autocmd Filetype vimwiki nmap <buffer> <CR> o<ESC>
  autocmd Filetype vimwiki nmap <buffer> # <Plug>VimwikiAddHeaderLevel
  autocmd Filetype vimwiki nmap <buffer> <C-]> <Plug>VimwikiFollowLink
  autocmd Filetype vimwiki nmap <buffer> <C-T> <Plug>VimwikiGoBackLink
augroup END
]])
