---------------------------------------------------------------
-- Theme
---------------------------------------------------------------
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

require("base16-colorscheme").with_config({
  telescope = true,
  telescope_borders = true,
  indentblankline = true,
  notify = true,
  ts_rainbow = true,
  cmp = true,
  illuminate = true,
  lsp_semantic = false,
  mini_completion = true,
  dapui = true,
})

vim.opt.syntax = "enable"
vim.api.nvim_command("colorscheme base16-gruvbox-dark-medium")

-- Make legible if not using my terminal emulator, i.e. no window manager
if vim.env.TERM == "tmux" then
  vim.api.nvim_command("highlight clear")
  vim.api.nvim_command("highlight ColorColumn guibg=grey")
  vim.api.nvim_command("highlight TelescopeSelection guibg=blue")
  vim.api.nvim_command("highlight NormalFloat guibg=black")
  vim.api.nvim_command("highlight NormalFloat guifg=yellow")
end

-- Remove (almost) all italics
vim.api.nvim_command("highlight TSComment gui=none")
vim.api.nvim_command("highlight TSConstBuiltin gui=none")
vim.api.nvim_command("highlight TSFuncBuiltin gui=none")
vim.api.nvim_command("highlight TSTypeBuiltin gui=none")
vim.api.nvim_command("highlight TSVariableBuiltin gui=none")
vim.api.nvim_command("highlight LspInlayHint gui=none")
vim.api.nvim_command("highlight @text.italic gui=italic")
vim.api.nvim_command("highlight TSEmphasis gui=italic")

vim.opt.laststatus = 2
vim.opt.ttimeoutlen = 10

---------------------------------------------------------------
-- Lightline
---------------------------------------------------------------
local function parinfer_mode()
  if vim.g.parinfer_mode == nil then
    return ""
  else
    return vim.g.parinfer_mode
  end
end

require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "jellybeans",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { parinfer_mode, "filename" },
    lualine_c = { "diff" },
    lualine_x = { "lsp_progress" },
    lualine_y = { "filetype", { "diagnostics", sources = { "nvim_lsp" } } },
    lualine_z = { "location" },
  },
  -- when the focus isn't on the window
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  tabline = {
    lualine_a = {
      {
        "tabs",
        cond = nil,
        max_length = vim.o.columns, -- Maximum width of tabs component.
        mode = 2, -- 0: Shows tab_nr, 1: Shows tab_name, 2: Shows tab_nr + tab_name
        tabs_color = {
          active = { fg = "#e8e8d3", bg = "#666656" },
          inactive = { fg = "#666656", bg = "#30302c" },
        },
      },
    },
  },
  extensions = { "quickfix", "fugitive" },
})

-- lualine seems to set this to 2, change it back to 1
vim.opt.showtabline = 1
