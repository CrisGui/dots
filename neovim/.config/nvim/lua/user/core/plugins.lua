local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  root = vim.fn.stdpath("data") .. "/lazy",
  defaults = {
    lazy = true,
    cond = not require "user.core.utils".is_vscode_running(),
    version = "*",
  },
  spec = nil,
  local_spec = true,
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
  concurrency = 10, --jit.os:find("Windows") and (vim.uv.available_parallelism() * 2) or nil,
  git = {
    log = { "-5" },
    timeout = 120,
    url_format = "https://github.com/%s.git",
    filter = true,
  },
  pkg = {
    enabled = true,
    cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
    version = true,
    sources = {
      "lazy",
      "packspec",
      "rockspec",
    },
  },
  rocks = {
    root = vim.fn.stdpath("data") .. "/lazy/-rocks",
    server = "https://nvim-neorocks.github.io/rocks-binaries/",
  },
  dev = {
    path = "~/projects",
    patterns = {},
    fallback = false,
  },
  install = {
    missing = true,
    colorscheme = { "default" },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "none",
    backdrop = 60,
    title = nil,
    title_pos = "center",
    pills = true,
    icons = {
      cmd = " ",
      config = "",
      event = " ",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = " ",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    browser = nil, --"librewolf",
    throttle = 20,
  },
  diff = {
    cmd = "terminal_git",
  },
  checker = {
    enabled = true,
    concurrency = 10,
    notify = true,
    frequency = 3600,
    check_pinned = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = false,
      paths = {},
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        --"editorconfig",
        "man",
        --"osc52",
        "rplugin",
        "shada",
        --"spellfile",
        "zipPlugin",
        "filetype",
      },
    },
  },
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md", "README" },
    skip_if_doc_exists = true,
  },
  state = vim.fn.stdpath("state") .. "/lazy/state.json",
  build = {
    warn_on_override = true,
  },
  profiling = {
    loader = true,
    require = true,
  },
}
require "lazy".setup({ { import = "user/plugins" } }, opts)
