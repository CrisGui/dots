return {
  'nvim-treesitter/nvim-treesitter',
  main ="nvim-treesitter",
  event = "BufEnter",
  build = "TSUpdate",
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "dockerfile",
        "git_config",
        "gitcommit",
        "gitignore",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "toml",
        "yaml",
        "vim",
        "vimdoc",
        "query",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      textobjects = { enable = true },
      indent = {
        enable = true
      },
    }
  end,
}
