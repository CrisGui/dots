local set = vim.opt
local let = vim.g

let.markdown_fenced_languages_enable_all = true --{'html', 'python', 'lua', 'vim', 'typescript', 'javascript', 'css', 'c', 'c++', 'rust'}
let.vim_markdown_fenced_languages = { 'csharp=cs', 'c++=cpp', 'javascript=js', 'typescript=ts', 'markdown=md' }
set.conceallevel = 2
let.tex_conceal = "abdmgs"
--set.conceal = ""

let.editorconfig = true

set.spell = true
set.spelllang = "en,cjk"
let.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell"
let.spelloptions = "camel,noplainbuffer"
set.syntax = "enable"

set.cmdheight = 0
set.showmode = true

set.number = true
set.relativenumber = true
set.numberwidth = 1

set.clipboard = "unnamedplus"
set.completeopt = { 'menuone', 'noselect', 'noinsert' }
set.mouse = "a"
set.mousemodel = "popup_setpos"
set.mousefocus = true
set.mousehide = true

set.cursorline = true

set.smartcase = true
set.ignorecase = true

set.foldenable = false
set.foldcolumn = "1"
set.foldlevel = 99
set.foldlevelstart = 99
set.foldmethod = 'indent'
set.foldexpr = let["nvim_treesitter#foldexpr()"]
--set.foldexpr = vim.g['nvim_treesitter#folder()']

set.showmatch = true
set.hlsearch = false
set.incsearch = true

set.wrap = true

set.linebreak = true
set.breakindent = true
set.autoindent = true
set.copyindent = true
set.smartindent = true

set.expandtab = true
set.softtabstop = 2
set.tabstop = 2
set.shiftwidth = 2

set.termguicolors = true
-- set.guicursor = ""

--set.wildmenu = true
set.pumheight = 20

set.undofile = true
set.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir/"
set.undolevels = 1000
set.undoreload = 1000
set.backup = true
set.writebackup = true
set.backupdir = os.getenv("HOME") .. "/.cache/nvim/backup/"
set.swapfile = false
set.autowrite = true

set.splitbelow = true
set.splitright = true

set.scrolloff = 10
set.sidescrolloff = 10
set.signcolumn = "yes:1"

set.timeoutlen = 300
set.updatetime = 50
set.hidden = true
set.history = 100
set.lazyredraw = true
set.synmaxcol = 240

set.colorcolumn = "80"

set.ff = "unix"

set.isfname:append("@-@")
set.shortmess:append("flmnrwxsI") -- :help 'shortmess'
set.iskeyword:append("-")

set.encoding = "utf-8"
set.fileencoding = "utf-8"
let.scriptencoding = "utf-8"

let.vimsyn_embed = 'l'

set.background = "dark"

set.viewoptions = { "folds", "options", "cursor", "unix", "slash" }
