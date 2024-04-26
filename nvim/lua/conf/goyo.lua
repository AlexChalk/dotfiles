vim.g.goyo_width = 80
vim.g.goyo_height = "85%"
vim.g.goyo_linenr = 0

local function goyo_enter()
  require("lualine").hide({
    place = { "statusline", "tabline", "winbar" },
    unhide = false,
  })
  vim.opt.statusline = "%!v:lua.require('word_count').get_statusline()"
  vim.cmd.highlight("StatusLine ctermfg=white guifg=#bdae93")
  -- vim.cmd.colorscheme("base16-catppuccin-latte")
  vim.opt.showtabline = 0
end

local function goyo_leave()
  require("lualine").hide({
    place = { "statusline", "tabline", "winbar" },
    unhide = true,
  })
  -- vim.cmd.colorscheme("base16-gruvbox-dark-medium")
  vim.opt.showtabline = 1
end

vim.api.nvim_create_autocmd("User", { pattern = "GoyoEnter", callback = goyo_enter })
vim.api.nvim_create_autocmd("User", { pattern = "GoyoLeave", callback = goyo_leave })

-- https://github.com/junegunn/goyo.vim/issues/79#issuecomment-134466320
-- <c-w>= to fix margin size issues
