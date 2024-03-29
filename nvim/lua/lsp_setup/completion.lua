----------------------------------------------------------------
-- Completion
----------------------------------------------------------------
----------------------------------------------------------------
-- Built-in
----------------------------------------------------------------
-- The good stuff is documented in |ins-completion|

-- HIGHLIGHTS:
-- - ^x^n for JUST this file
-- - ^x^f for filenames (works with our path trick!)
-- - ^x^] for tags only
-- - ^n for anything specified by the 'complete' option
-- - Use ^n and ^p to go back and forth in the suggestion list

local lspkind = require("lspkind")
lspkind.init()
local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  -- enable_autosnippets = true,
})

require("luasnip.loaders.from_vscode").load()

luasnip.add_snippets("javascript", require("snippets.javascript"))
luasnip.add_snippets("typescript", require("snippets.javascript"))
luasnip.add_snippets("tex", require("snippets.tex"))

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  return require("commands.snip").jump_forward()
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  return require("commands.snip").jump_back()
end, { silent = true })

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" },
    { name = "buffer" },
  }),
})

cmp.setup.filetype("yaml", {
  sources = cmp.config.sources({
    { name = "papis" },
    { name = "buffer" },
  }),
})

for _, sql_file in ipairs({ "sql", "mysql", "plsql" }) do
  cmp.setup.filetype(sql_file, {
    sources = cmp.config.sources({
      { name = "vim-dadbod-completion" },
      { name = "buffer" },
    }),
  })
end

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
    { name = "cmdline" },
  }),
})

cmp.setup({
  completion = {
    autocomplete = false, -- disable auto-completion.
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-h>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
    ["<Tab>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<C-l>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  }),
  formatting = {
    fields = { "abbr", "kind", "menu" },
    expandable_indicator = true,
    format = lspkind.cmp_format({
      mode = "text",
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[lsp]",
        nvim_lua = "[lua]",
        path = "[path]",
        luasnip = "[snip]",
        cmp_git = "[gh]",
        ["vim-dadbod-completion"] = "[sql]",
      },
    }),
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
