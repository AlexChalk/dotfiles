-----------------------------------------------------
-- Editing Misc.
-----------------------------------------------------
local opt = vim.opt

vim.cmd("filetype indent plugin on")

-- Allow backspacing over everything in insert mode.
opt.backspace = { "indent", "eol", "start" }
opt.scrolloff = 2 -- Maintain slight scroll
opt.showcmd = true -- Display incomplete commands
opt.history = 50 -- Keep 50 lines of command line history
opt.ignorecase = true -- Make searches case-insensitive by default.
opt.smartcase = true -- Override ignorecase if caps are used.
opt.iskeyword = opt.iskeyword + { "-" } -- Define `w` consistently for - and _
opt.wildmenu = true
opt.lazyredraw = true
opt.formatoptions = opt.formatoptions - { "t" }
-- opt.path = opt.path + {'**'}       -- Disabled because it doesn't play nice with node_modules

-- In many terminal emulators the mouse works just fine, thus enable it.
if vim.fn.has("mouse") == 1 then
  opt.mouse = "a"
end
