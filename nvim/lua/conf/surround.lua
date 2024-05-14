----------------------------------------------------------------
-- Customize default vim-surround bindings: ys -> s
----------------------------------------------------------------
vim.g.surround_no_mappings = true

vim.keymap.set({ "n" }, "ds", "<Plug>Dsurround", { noremap = false, silent = true })
vim.keymap.set({ "n" }, "cs", "<Plug>Csurround", { noremap = false, silent = true })
vim.keymap.set({ "n" }, "cS", "<Plug>CSurround", { noremap = false, silent = true })
vim.keymap.set({ "n" }, "s", "<Plug>Ysurround", { noremap = false, silent = true })
vim.keymap.set({ "n" }, "S", "<Plug>YSurround", { noremap = false, silent = true })
vim.keymap.set({ "n" }, "ss", "<Plug>Yssurround", { noremap = false, silent = true })
vim.keymap.set({ "n" }, "Ss", "<Plug>YSsurround", { noremap = false, silent = true })
vim.keymap.set({ "n" }, "SS", "<Plug>YSsurround", { noremap = false, silent = true })
vim.keymap.set({ "v" }, "S", "<Plug>VSurround", { noremap = false, silent = true })
vim.keymap.set({ "v" }, "gS", "<Plug>VgSurround", { noremap = false, silent = true })
vim.keymap.set(
  { "i" },
  "<C-S>",
  "<Plug>Isurround",
  { noremap = false, silent = true }
)
vim.keymap.set(
  { "i" },
  "<C-G>s",
  "<Plug>Isurround",
  { noremap = false, silent = true }
)
vim.keymap.set(
  { "i" },
  "<C-G>S",
  "<Plug>ISurround",
  { noremap = false, silent = true }
)
