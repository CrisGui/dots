local u = require "user.core.utils"

return {
  {
    'williamboman/mason.nvim',
    --event = "BufEnter",
    --lazy = false,
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
    },
    config = function()
      require "mason".setup {
        max_concurrent_installers = 5,
        upgrade_pip = true,
      }
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    --event = "BufEnter",
    lazy = false,
    branch = 'v3.x',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      local lsp = require "lsp-zero"
      lsp.extend_lspconfig()

      local lsp_on_attach = lsp.on_attach(function(_, _) --(client, bufnr)
        --lsp.default_keymaps({buffer = bufnr})
        u.map("n", "gd", vim.lsp.buf.definition, { desc = "[g]o [d]efinition" })
        u.map("n", "gD", vim.lsp.buf.declaration, { desc = "[g]o [D]eclaration" })
        u.map("n", "gi", vim.lsp.buf.implementation, { desc = "[g]o [i]mplementation" })
        u.map("n", "gr", require "telescope.builtin".lsp_references, { desc = "[g]o [r]eferences" })
        u.map("n", "K", vim.lsp.buf.hover, { desc = "[K]wonledge" })

        u.map("n", "<F7>", vim.lsp.buf.rename, { desc = "Rename all references" })
        u.map("n", "<F6>", vim.lsp.buf.format, { desc = "Format code" })
        u.map("n", "<F5>", vim.lsp.buf.code_action, { desc = "Show available code actions" })
      end)

      local cmp_capabilities = require "cmp_nvim_lsp".default_capabilities()

      require "mason-lspconfig".setup {
        ensure_installed = {},
        handlers = {
          function(server_name)
            require 'lspconfig'[server_name].setup({
              on_attach = lsp_on_attach,
              capabilites = cmp_capabilities,
            })
          end,
        },
      }
    end,
  },
  {
    "rafamadriz/friendly-snippets",
  },
  {
    'hrsh7th/nvim-cmp',
    --event = "BufEnter",
    lazy = false,
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require("luasnip").config.set_config({
            enable_autosnippets = true,
            --store_selection_keys = "<Tab>",
          })
          require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/user/snippets" })
        end
      },
      { "saadparwaiz1/cmp_luasnip" },
    },
    config = function()
      local cmp = require "cmp"
      local cmp_action = require('lsp-zero').cmp_action()

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup {
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
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
  },
}
