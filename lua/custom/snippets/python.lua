local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node

return {
  s({ trig = 'query' }, {
    t { 'query = """' },
    t { '', '    SELECT ' },
    i(1, '*'),
    t { '', '    FROM ' },
    i(2, 'db'),
    t { '', '"""' },
  }),
}
-- vim: ts=2 sts=2 sw=2 et
