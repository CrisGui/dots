return {
  'L3MON4D3/LuaSnip',
  main = "luasnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip"
  },
  config = function()
    require "luasnip".config.set_config {
      enable_autosnippets = true,
    }
    require "luasnip.loaders.from_lua".lazy_load { paths = vim.fn.stdpath("config") .. "/lua/user/snippets" }
  end
}
