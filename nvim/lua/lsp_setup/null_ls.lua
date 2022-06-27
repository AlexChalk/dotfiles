-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.eslint.with({
    --   prefer_local = "node_modules/.bin",
    -- }),

    -- null_ls.builtins.formatting.eslint.with({
    --   prefer_local = "node_modules/.bin",
    -- }),

    null_ls.builtins.diagnostics.flake8,

    -- might need to pipx install this one
    null_ls.builtins.formatting.reorder_python_imports,

    null_ls.builtins.formatting.black.with({
      extra_args = { "-v", "--config", "pyproject.toml" },
    }),

    -- null_ls.builtins.formatting.latexindent,

    null_ls.builtins.formatting.pg_format,

    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "2", "-ci" },
    }),

    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand("$HOME/dotfiles/stylua.toml") },
    }),
  },
})
