local luasnip = require("luasnip")
local rep = require("luasnip.extras").rep
local s = luasnip.s
local t = luasnip.t
local i = luasnip.i

local snippets = {
  s({ dscr = "{}", trig = "{}" }, { t({ "{", "  " }), i(0), t({ "", "}" }) }),
  s({ dscr = "();", trig = "();" }, { t({ "(", "  " }), i(0), t({ "", ");" }) }),
  s({ dscr = "{};", trig = "{};" }, { t({ "{", "  " }), i(0), t({ "", "};" }) }),
  s({ dscr = "{});", trig = "{});" }, { t({ "{", "  " }), i(0), t({ "", "});" }) }),
  s(
    { dscr = "{}));", trig = "{}));" },
    { t({ "{", "  " }), i(0), t({ "", "}));" }) }
  ),
  s({ dscr = "{},", trig = "{}," }, { t({ "{", "  " }), i(0), t({ "", "}," }) }),
  s({ dscr = "('", trig = "('" }, { t({ "('" }), i(0), t({ "');" }) }),
  s(
    { dscr = "req", trig = "req" },
    { t({ 'require("' }), i(0, "module"), t({ '");' }) }
  ),
  s({ dscr = "Describe", trig = "des" }, {
    t({
      'describe("',
    }),
    i(1, "description"),
    t({ '", () => {', "  " }),
    i(0),
    t({ "", "});" }),
  }),
  s({ dscr = "it async", trig = "it" }, {
    t({
      'it("',
    }),
    i(1, "description"),
    t({ '", async () => {', "  " }),
    i(0),
    t({ "", "});" }),
  }),
  s({ dscr = "it", trig = "its" }, {
    t({
      'it("',
    }),
    i(1, "description"),
    t({ '", () => {', "  " }),
    i(0),
    t({ "", "});" }),
  }),
  s({ dscr = "before each", trig = "bef" }, {
    t({ "beforeEach(() => {", "  " }),
    i(0),
    t({ "", "});" }),
  }),
  s({ dscr = "after each", trig = "af" }, {
    t({ "afterEach(() => {", "  " }),
    i(0),
    t({ "", "});" }),
  }),
  s({ dscr = "before each async", trig = "befa" }, {
    t({ "beforeEach(async () => {", "  " }),
    i(0),
    t({ "", "});" }),
  }),
  s({ dscr = "after each async", trig = "afa" }, {
    t({ "afterEach(async () => {", "  " }),
    i(0),
    t({ "", "});" }),
  }),
  s({ dscr = "sfc", trig = "sfc" }, {
    t({
      "import React from 'react';",
      "import PropTypes from 'prop-types';",
      "",
      "const ",
    }),
    i(1, "Component"),
    t({ " = ({ " }),
    i(2, "props"),
    t({ " }) => {", "  " }),
    i(0),
    t({ "", "  return (", "    ", "  );", "};", "" }),
    rep(1),
    t({ ".propTypes = {", "  " }),
    rep(2),
    t({ ",", "};", "", "export default " }),
    rep(1),
    t({ ";" }),
  }),
}

return snippets
