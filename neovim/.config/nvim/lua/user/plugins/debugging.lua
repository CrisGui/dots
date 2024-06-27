local u = require "user.core.utils"

return {
  "rcarriga/nvim-dap-ui",
  lazy = false,
  --cmd = {"DapContinue", },
  dependencies = {
    { "mfussenegger/nvim-dap" },
    --{ "theHamsta/nvim-dap-virtual-text" },
    { "nvim-neotest/nvim-nio" },
    {
      "jay-babu/mason-nvim-dap.nvim",
      config = function()
        require("mason").setup()
        require("mason-nvim-dap").setup({
          handlers = {
            function(config)
              require("mason-nvim-dap").default_setup(config)
            end,
          },
        })
      end,
    }
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    dapui.setup()
    -- u.map("n", "Di", dapui.toggle(), { desc = "[D]ebug [i]nterface" })
    -- u.map("n", "Db", dap.toggle_breakpoint(), { desc = "[D]ebug [b]breakpoint" })
    -- u.map("n", "Dbc", dap.clear_breakpoints(), { desc = "[D]ebug [b]breakpoint [c]lear" })
    -- u.map("n", "Dc", dap.continue(), { desc = "[D]ebug [c]ontinue" })
    -- u.map("n", "Dr", function() dapui.open({ reset = true }) end, { desc = "[D]ebug [r]eset" })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = ' ', texthl = '', linehl = '', numhl = '' })

    u.map("n", "<F12>", function() dap.continue() end)
    u.map("n", "<F11>", function() dap.toggle_breakpoint() end)
    u.map("n", "<F10>", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
    u.map({ "n", "v" }, "<f9>", function()
      require("dap.ui.widgets").preview()
    end)
    u.map("n", "<F8>", function() dap.terminate() end)
  end
}
