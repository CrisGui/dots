return {
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "BufEnter",
  keys = {
    {
      "<leader>fe",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "[F]ile [E]xplorer" ,
    },
  },
  opts = {
    open_for_directories = false,
    floating_window_scaling_factor = 0.75,
    yazi_floating_window_border = 'single',
  },
}
