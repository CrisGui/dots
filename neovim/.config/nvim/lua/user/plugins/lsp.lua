local u = require "user.core.utils"

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    main = "lsp-zero",
    --event = "BufEnter",
    lazy = false,
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      local lsp = require "lsp-zero"
      lsp.extend_lspconfig()

      local lsp_on_attach = lsp.on_attach(function(_, bufnr) --(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
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
}
