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
})

require("luasnip.loaders.from_vscode").load()

luasnip.snippets = {
  javascript = require("snippets.javascript"),
  typescript = require("snippets.javascript"),
}

vim.api.nvim_set_keymap(
  "i",
  "<c-j>",
  [[<Cmd>lua require("snip_commands").jump_forward()<CR>]],
  { silent = true }
)
vim.api.nvim_set_keymap(
  "i",
  "<c-k>",
  [[<Cmd>lua require("snip_commands").jump_back()<CR>]],
  { silent = true }
)
vim.api.nvim_set_keymap(
  "s",
  "<c-j>",
  [[<Cmd>lua require("snip_commands").jump_forward()<CR>]],
  { silent = true }
)
vim.api.nvim_set_keymap(
  "s",
  "<c-k>",
  [[<Cmd>lua require("snip_commands").jump_back()<CR>]],
  { silent = true }
)

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
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
    ["<C-h>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
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
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[lsp]",
        nvim_lua = "[lua]",
        path = "[path]",
        luasnip = "[snip]",
        gh_issues = "[gh]",
        ["vim-dadbod-completion"] = "[sql]",
      },
    }),
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})

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
