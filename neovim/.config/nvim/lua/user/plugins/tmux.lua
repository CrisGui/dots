return {
  "alexghergh/nvim-tmux-navigation",
  main = 'nvim-tmux-navigation',
  event = "UIEnter",
  config = function()
    require 'nvim-tmux-navigation'.setup({
      disable_when_zoomed = false,
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      }
    })
  end,
}
