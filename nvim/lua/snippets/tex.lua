local luasnip = require("luasnip")
local s = luasnip.s
local t = luasnip.t
local i = luasnip.i

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
  s({ dscr = "citation", trig = [[\cite]] }, {
    t({
      [[\cite{]],
    }),
    i(1, ""),
    t({ "}" }),
    i(0),
  }),
  s({ dscr = "citation_pinpoint", trig = [[\citep]] }, {
    t({
      [[\cite[]],
    }),
    i(2, "pinpoint"),
    t({ "]{" }),
    i(1, ""),
    t({ "}" }),
    i(0),
  }),
}

return snippets
