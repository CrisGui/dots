return {
  'hrsh7th/nvim-cmp',
  main = "cmp",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    -- "hrsh7th/cmp-path",
    -- "hrsh7th/cmp-buffer",
  },
  config = function()
    local cmp = require "cmp"
    local cmp_action = require 'lsp-zero'.cmp_action()

    require "luasnip.loaders.from_vscode".lazy_load()

    cmp.setup {
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      snippet = {
        expand = function(args)
          require 'luasnip'.lsp_expand(args.body)
          --vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Esc>"] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),
        --["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        --["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      }),
      sources = cmp.config.sources(
        { { name = "nvim_lsp" },
          { name = "luasnip" } },
        { { name = "buffer" } }
      ),
    }
  end,
}
