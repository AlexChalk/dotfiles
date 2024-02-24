local luasnip = require("luasnip")
local s = luasnip.s
local t = luasnip.t
local i = luasnip.i
local events = require("luasnip.util.events")

local snippets = {
  s(
    { dscr = "italic", trig = "*" },
    { t({ [[\textit{]] }), i(1), t({ "}" }), i(0) }
  ),
  s(
    { dscr = "quote", trig = [["]] },
    { t({ [[\textquote{]] }), i(1), t({ "}" }), i(0) }
  ),
  s(
    { dscr = "block_quote", trig = [["""]] },
    { t({ [[\blockquote{]] }), i(1), t({ "}" }), i(0) }
  ),
  s({ dscr = "citation_pinpoint", trig = [[\citep]] }, {
    t([[\cite[]]),
    i(2, "pinpoint"),
    t({ "]{" }),
    i(1, ""),
    t({ "}" }),
    i(0),
  }),
  s({ dscr = "citation", trig = [[\cite]] }, {
    t([[\cite{]]),
    i(1, ""),
    t("}"),
    i(0),
  }),
  -- n.b. These last ones won't play nicely with luasnip.jump. I think this is also
  -- callback abuse.
  s({ dscr = "zotero_citation_pinpoint", trig = [[\zotp]] }, {
    t([[\cite[]]),
    i(2, "pinpoint"),
    t({ "]{" }),
    i(1, ""),
    t({ "}" }),
    i(0),
  }, {
    callbacks = {
      [1] = {
        [events.enter] = function(_)
          return vim.cmd([[Telescope bibtex format=plain]])
        end,
      },
    },
  }),
  s({ dscr = "zotero_citation", trig = [[\zot]] }, {
    t([[\cite{]]),
    i(1),
    t("}"),
    i(0),
  }, {
    callbacks = {
      [1] = {
        [events.enter] = function(_)
          return vim.cmd([[Telescope bibtex format=plain]])
        end,
      },
    },
  }),
}

return snippets
