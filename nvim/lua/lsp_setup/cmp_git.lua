local utils = require("cmp_git.utils")

require("cmp_git").setup({
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
      state = "all", -- open, closed, all
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
  trigger_actions = {
    {
      debug_name = "git_commits",
      trigger_character = ":",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.git:get_commits(callback, params, trigger_char)
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
