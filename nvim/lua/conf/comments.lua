-----------------------------------------------------
-- Comments
-----------------------------------------------------
require("Comment").setup({
  padding = true,

  sticky = true,

  -- ignores empty lines
  ignore = "^$",

  toggler = {
    line = "gcc",
    block = "gbc",
  },

  opleader = {
    line = "gc",
    block = "gb",
  },

  extra = {
    above = "gcO",
    below = "gco",
    eol = "gcA",
  },

  mappings = {
    basic = true,
    extra = true,
    extended = false,
  },

  pre_hook = nil,
  post_hook = nil,
})

local ft = require("Comment.ft")

ft.clojure = { ";; %s" }
