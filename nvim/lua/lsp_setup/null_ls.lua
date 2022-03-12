-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.eslint.with({
    --   prefer_local = "node_modules/.bin",
    -- }),
    null_ls.builtins.diagnostics.flake8.with({
      command = require("commands.python").get_python_bin_path("flake8"),
    }),

    -- null_ls.builtins.formatting.reorder_python_imports.with({
    --   command = require("commands.python").get_python_bin_path("reorder-python-imports"),
    -- }),

    -- null_ls.builtins.formatting.nixpkgs_fmt,
    -- null_ls.builtins.formatting.latexindex,
    -- null_ls.builtins.formatting.pgFormatter,

    null_ls.builtins.formatting.black.with({
      command = require("commands.python").get_python_bin_path("black"),
      extra_args = { "-v", "--config", "pyproject.toml" },
    }),
    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "2", "-ci" },
    }),
    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand("$HOME/dotfiles/stylua.toml") },
    }),
  },
})
