vim.g.goyo_width = 80
vim.g.goyo_height = "85%"
vim.g.goyo_linenr = 0

local function goyo_enter()
  require("lualine").hide({
    place = { "statusline", "tabline", "winbar" },
    unhide = false,
  })
  vim.opt.showtabline = 0
end

local function goyo_leave()
  require("lualine").hide({
    place = { "statusline", "tabline", "winbar" },
    unhide = true,
  })
  vim.opt.showtabline = 1
end

vim.api.nvim_create_autocmd("User", { pattern = "GoyoEnter", callback = goyo_enter })
vim.api.nvim_create_autocmd("User", { pattern = "GoyoLeave", callback = goyo_leave })
