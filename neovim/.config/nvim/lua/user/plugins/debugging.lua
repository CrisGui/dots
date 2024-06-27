local u = require "user.core.utils"

return {
  "rcarriga/nvim-dap-ui",
  main = "dapui",
  key = "<F12>",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      main = "dap",
    },
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    dapui.setup()

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
      require "dap.ui.widgets".preview()
    end)
    u.map("n", "<F8>", function() dap.terminate() end)
  end
}
