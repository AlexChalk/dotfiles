-----------------------------------------------------
-- LSP
-----------------------------------------------------
-- Import config dependencies
require("lsp_setup.cmp_git")
require("lsp_setup.completion")
require("lsp_setup.bindings")
require("lsp_setup.handlers")
require("lsp_setup.null_ls")

-- :help vim.lsp.buf

-- LSP settings
local lspconfig = require("lspconfig")

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = require("lsp_setup.bindings").on_attach

-- Enable the following language servers
local servers = {
  "bashls",
  "clangd",
  "clojure_lsp",
  "cssls",
  "dockerls",
  "elmls",
  "eslint",
  "gopls",
  "hls",
  "jsonls",
  "rnix",
  "rust_analyzer",
  "solargraph",
  "terraformls",
  "texlab",
  "tsserver",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = "information",
        },
      },
    },
  },
  -- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-851247107
  before_init = function(_, config)
    config.settings.python.pythonPath =
      require("commands.python").get_python_bin_path()
  end,
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yml", "yaml", "yaml.docker-compose" },
})

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
