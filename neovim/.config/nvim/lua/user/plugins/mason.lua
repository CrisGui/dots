return {
  'williamboman/mason.nvim',
  main = "mason",
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require "mason".setup {
      max_concurrent_installers = 5,
      upgrade_pip = true,
    }
    require "mason-nvim-dap".setup({
      handlers = {
        function(config)
          require "mason-nvim-dap".default_setup(config)
        end,
      },
    })
  end,
}
