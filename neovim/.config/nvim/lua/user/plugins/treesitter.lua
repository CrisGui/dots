return {
  'nvim-treesitter/nvim-treesitter',
  event = "VimEnter",
  build = ":TSUpdate",
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
        "go",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "sql",
        --"tmux",
        "toml",
        "typescript",
        "yaml",
        "zig",
        "vim",
        "vimdoc",
        "query",
      },
      sync_install = false,
      auto_install = true,
      --ignore_install = { "vim", "vimdoc" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
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
