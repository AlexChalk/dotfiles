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
--
local cmp = require("cmp")
local luasnip = require("luasnip")

-- Manually trigger completion info
-- https://github.com/neoclide/coc.nvim/wiki/Using-snippets (old way)
-- https://github.com/hrsh7th/nvim-cmp/search?q=trigger+completion+is%3Aissue&type=issues
-- https://github.com/hrsh7th/nvim-cmp/issues/178

require("luasnip.loaders.from_vscode").load()

luasnip.snippets = {
  javascript = require("snippets.javascript"),
  typescript = require("snippets.javascript"),
}

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    { name = "buffer" },
  }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
    { name = "cmdline" },
  }),
})

-- Setup lspconfig.
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(
--   vim.lsp.protocol.make_client_capabilities()
-- )
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
--   capabilities = capabilities,
-- })

cmp.setup({
  completion = {
    autocomplete = false, -- disable auto-completion.
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
      ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<Tab>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lua' },
      -- { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      { name = 'buffer' },
    })
  })

-- _G.vimrc = _G.vimrc or {}
-- _G.vimrc.cmp = _G.vimrc.cmp or {}
-- _G.vimrc.cmp.omni = function()
--   cmp.complete({
--     config = {
--       sources = cmp.config.sources({
--         { name = "nvim_lua" },
--         -- { name = "nvim_lsp" },
--         -- { name = "luasnip" }, -- For luasnip users.
--         -- { name = "ultisnips" }, -- For ultisnips users.
--         { name = "buffer" },
--       }),
--     },
--   })
-- end
--
-- vim.cmd([[
--   inoremap <C-x><C-o> <Cmd>lua vimrc.cmp.omni()<CR>
-- ]])

require("cmp_git").setup({
  -- defaults
  filetypes = { "gitcommit" },
  remotes = { "upstream", "origin" }, -- in order of most to least prioritized
  git = {
    commits = {
      sort_by = function(commit) -- nil, "sha", "title", "description", "author_name", "author_email", "commit_timestamp", or custom function
        return string.format("%010d", commit.diff)
      end,
      limit = 100,
      filter_fn = function(trigger_char, commit)
        return string.format("%s %s %s", trigger_char, commit.sha, commit.title)
      end,
    },
  },
  github = {
    issues = {
      filter = "all", -- assigned, created, mentioned, subscribed, all, repos
      limit = 100,
      state = "open", -- open, closed, all
      sort_by = function(issue) -- nil, "number", "title", "body", or custom function
        return string.format(
          "%010d",
          os.difftime(os.time(), utils.parse_github_date(issue.updatedAt))
        )
      end,
      filter_fn = function(trigger_char, issue)
        return string.format("%s %s %s", trigger_char, issue.number, issue.title)
      end,
    },
    mentions = {
      limit = 100,
      sort_by = nil, -- nil, "login", or custom function
      filter_fn = function(trigger_char, mention)
        return string.format("%s %s %s", trigger_char, mention.username)
      end,
    },
    pull_requests = {
      limit = 100,
      state = "open", -- open, closed, merged, all
      sort_by = function(pr) -- nil, "number", "title", "body", or custom function
        return string.format(
          "%010d",
          os.difftime(os.time(), utils.parse_github_date(pr.updatedAt))
        )
      end,
      filter_fn = function(trigger_char, pr)
        return string.format("%s %s %s", trigger_char, pr.number, pr.title)
      end,
    },
  },
  gitlab = {
    issues = {
      limit = 100,
      state = "opened", -- opened, closed, all
      sort_by = function(issue) -- nil, "iid", "title", "description", or custom function
        return string.format(
          "%010d",
          os.difftime(os.time(), utils.parse_gitlab_date(issue.updated_at))
        )
      end,
      filter_fn = function(trigger_char, issue)
        return string.format("%s %s %s", trigger_char, issue.iid, issue.title)
      end,
    },
    mentions = {
      limit = 100,
      sort_by = nil, -- nil, "username", "name", or custom function
      filter_fn = function(trigger_char, mention)
        return string.format("%s %s", trigger_char, mention.username)
      end,
    },
    merge_requests = {
      limit = 100,
      state = "opened", -- opened, closed, locked, merged
      sort_by = function(mr) -- nil, "iid", "title", "description", or custom function
        return string.format(
          "%010d",
          os.difftime(os.time(), utils.parse_gitlab_date(mr.updated_at))
        )
      end,
      filter_fn = function(trigger_char, mr)
        return string.format("%s %s %s", trigger_char, mr.iid, mr.title)
      end,
    },
  },
  trigger_actions = {
    {
      debug_name = "git_commits",
      trigger_character = ":",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.git:get_commits(callback, params, trigger_char)
      end,
    },
    {
      debug_name = "gitlab_issues",
      trigger_character = "#",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.gitlab:get_issues(callback, git_info, trigger_char)
      end,
    },
    {
      debug_name = "gitlab_mentions",
      trigger_character = "@",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.gitlab:get_mentions(callback, git_info, trigger_char)
      end,
    },
    {
      debug_name = "gitlab_mrs",
      trigger_character = "!",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.gitlab:get_merge_requests(callback, git_info, trigger_char)
      end,
    },
    {
      debug_name = "github_issues_and_pr",
      trigger_character = "#",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.github:get_issues_and_prs(callback, git_info, trigger_char)
      end,
    },
    {
      debug_name = "github_mentions",
      trigger_character = "@",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.github:get_mentions(callback, git_info, trigger_char)
      end,
    },
  },
})
