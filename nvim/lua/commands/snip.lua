local luasnip = require("luasnip")

local M = {}

M.jump_forward = function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end

M.jump_back = function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end

return M
