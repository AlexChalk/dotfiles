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
  lsp_semantic = true,
  mini_completion = true,
  dapui = true,
})

vim.opt.syntax = "enable"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "base16-gruvbox*",
  group = vim.api.nvim_create_augroup("base16-gruvbox", { clear = true }),
  callback = function()
    -- Make legible if not using my terminal emulator, i.e. no window manager
    if vim.env.TERM == "tmux" then
      vim.cmd.highlight("ColorColumn guibg=grey")
      vim.cmd.highlight("TelescopeSelection guibg=blue")
      vim.cmd.highlight("NormalFloat guibg=black")
      vim.cmd.highlight("NormalFloat guifg=yellow")
    end

    -- Remove (almost) all italics
    vim.cmd.highlight("TSComment gui=none")
    vim.cmd.highlight("TSConstBuiltin gui=none")
    vim.cmd.highlight("TSFuncBuiltin gui=none")
    vim.cmd.highlight("TSTypeBuiltin gui=none")
    vim.cmd.highlight("TSVariableBuiltin gui=none")
    vim.cmd.highlight("LspInlayHint gui=none")
    vim.cmd.highlight("@text.italic gui=italic")
    vim.cmd.highlight("TSEmphasis gui=italic")
  end,
})

vim.cmd.colorscheme("base16-gruvbox-dark-medium")

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

local function get_words()
  local show_word_count = { [""] = true, markdown = true }
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  local word_count = vim.fn.wordcount()

  if word_count.visual_words then
    return "WC: " .. tostring(word_count.visual_words)
  elseif show_word_count[filetype] then
    return "WC: " .. tostring(word_count.words)
  else
    return ""
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
    lualine_x = { "lsp_progress", get_words },
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
