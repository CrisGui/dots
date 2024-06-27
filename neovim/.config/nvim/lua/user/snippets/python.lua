local ls = require "luasnip"
--local lse = require "luasnip.extras"
local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = lse.lambda
-- local rep = lse.rep
-- local p = lse.partial
-- local m = lse.match
-- local n = lse.nonempty
-- local dl = lse.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.conditions")
-- local conds_expand = require("luasnip.extras.conditions.expand")

return {
  s({
      name = "main",
      trig = "main",
      desc = "Boilerplait for a basic main file",
      wordTrig = true,
      regTrig = false,
      trigEngine = "plain",
      snippetType = "snippet",
    },
  fmt(
    [[
    #!/usr/bin/env python


    def _main(*args, **kwargs):
        <>


    if __name__=="__main__": 
        _main()
    ]],
    { i(1,"raise NotImplementedError" ) },
    {delimiters = "<>"}
  )),
}
