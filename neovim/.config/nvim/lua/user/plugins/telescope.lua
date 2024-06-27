local u = require "user.core.utils"
return {
  --  "nvim-telescope/telescope-file-browser.nvim",
  --  event = "BufEnter",
  --  dependencies = {
    'nvim-telescope/telescope.nvim',
    --tag = '0.1.8',
    branch = '0.1.x',
    event = "BufEnter",
    --cmd = { "Telescope" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require "telescope"
      local builtin = require 'telescope.builtin'

      u.map('n', '<leader>ff', builtin.find_files, {desc = "[f]ind [f]ile"})
      u.map('n', '<leader>fs', builtin.live_grep, {desc = "[f]ind [s]tring"})
      u.map('n', '<leader>fb', builtin.buffers, {desc = "[f]ind [b]uffer"})
      u.map('n', '<leader>fg', builtin.git_files, {desc = "[f]ind [g]it"})
      u.map('n', '<leader>fr', builtin.registers, {desc = "[f]ind [r]egister"})

      telescope.setup {
        pickers = {
          registers = {theme = "cursor"},
          buffers = {theme = "ivy"},
          find_files = {theme = "ivy"},
          git_files = {theme = "ivy"},
        },
      }
    end,
  }
