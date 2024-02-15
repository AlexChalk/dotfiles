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
  post_hook = function()
    local filetypes = { clojure = true, clojurescript = true }
    local current_filetype = vim.bo.filetype
    if filetypes[current_filetype] then
      vim.call("parinfer#process_form")
    end
  end,
})

local ft = require("Comment.ft")

ft.clojure = { ";; %s" }
