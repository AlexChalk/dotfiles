-----------------------------------------------------
-- FZF
-----------------------------------------------------
-- Respect $HOME/.ignore
vim.api.nvim_set_keymap("n", "<c-p>", ":Files<CR>", { noremap = true })

-- Search everything
vim.api.nvim_set_keymap(
  "n",
  "<leader><c-p>",
  [[:lua vim.fn['fzf#vim#files']('', {source = 'rg --files --no-ignore --hidden --glob "!.git/*"'})<CR>]],
  { noremap = true }
)

vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow"
