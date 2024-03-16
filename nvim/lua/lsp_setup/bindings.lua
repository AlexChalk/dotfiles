local M = {}

-- Diagnostic keymaps
-- n.b. call function twice to jump into floating window, C-Wp to jump out
vim.api.nvim_set_keymap(
  "n",
  "<leader>do",
  "<cmd>lua vim.diagnostic.open_float()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "[d",
  "<cmd>lua vim.diagnostic.goto_prev()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "]d",
  "<cmd>lua vim.diagnostic.goto_next()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>q",
  "<cmd>lua vim.diagnostic.setloclist()<CR>",
  { noremap = true, silent = true }
)

M.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>gD",
    "<cmd>lua vim.lsp.buf.declaration()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>gdd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    opts
  )
  -- n.b. call function twice to jump into floating window, C-Wp to jump out
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>K",
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>fi",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader><C-k>",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>da",
    "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>dr",
    "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>dl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>gid",
    "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>lr",
    "<cmd>lua vim.lsp.buf.rename()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>fr",
    "<cmd>lua vim.lsp.buf.references()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>lca",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "x",
    "<leader>lca",
    "<cmd>lua vim.lsp.buf.code_action()<CR>v",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>lsd",
    [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>lsp",
    [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]],
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>fl",
    [[<cmd>lua vim.lsp.buf.format({ async = true, filter = function(client) return client.name ~= "lua_ls" end })<CR>]],
    opts
  )
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, { nargs = 0 })

  local no_lsp_highlighting = { lua = false }
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  if no_lsp_highlighting[filetype] then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

return M
