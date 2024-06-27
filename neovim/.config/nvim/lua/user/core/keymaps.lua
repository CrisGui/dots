local u = require "user.core.utils"

vim.g.mapleader = " "

-- SAVE AND QUIT FILES
u.map("", '<M-w>', '<CMD>w<CR>')
u.map("", '<M-W>', '<CMD>w!<CR>')
u.map("", '<M-q>', '<CMD>q<CR>')
u.map("", '<M-Q>', '<CMD>q!<CR>')
u.map("", '<M-x>', '<CMD>x<CR>')
u.map("", '<M-X>', '<CMD>x!<CR>')

-- REGISTER
u.map({ "n", "v" }, 'x', '"_x')
u.map({ "n", "v" }, 'X', '"_x')
u.map({ "n", "v" }, 'd', '"_d')
u.map({ "n", "v" }, 'D', '"_D')
u.map({ "n", "v" }, '<leader>y', '"+y')
u.map({ "n", "v" }, '<leader>Y', '"+Y')
u.map({ "n", "v" }, '<leader>p', '"+p')
u.map({ "n", "v" }, '<leader>P', '"+P')

-- SEARCH
u.map('n', 'n', 'nzzzv')
u.map('n', 'N', 'Nzzzv')
u.map('n', '#', '#zz')
u.map('n', '*', '*zz')

-- ESCAPE TO NORMAL MODE
u.map('i', 'jj', '<ESC>')

-- MOVEMENT
u.map('n', '<C-h>', '<C-w>h')
u.map('n', '<C-j>', '<C-w>j')
u.map('n', '<C-k>', '<C-w>k')
u.map('n', '<C-l>', '<C-w>l')

--u.map({'v', 'x'}, '<C-j>', '<CMD>move .+1<CR>gv=gv')
--u.map({'v', 'x'}, '<C-k>', '<CMD>move .-2<CR>gv=gv')
--u.map({'v', 'x'}, '<C-h>', "'< <gv")
--u.map({'v', 'x'}, '<C-l>', "'> >gv")

-- BIG STETPS
u.map('n', '<M-h>', '_')
u.map('n', '<M-j>', '<C-d>zz')
u.map('n', '<M-k>', '<C-u>zz')
u.map('n', '<M-l>', '$')

u.map('n', '<Tab>', '<CMD>bNext<CR>')
u.map('n', '<S-Tab>', '<CMD>bnext<CR>')

-- LAYOUT
u.map('n', '<C-Up>', '<CMD>resize -2<CR>')
u.map('n', '<C-Down>', '<CMD>resize +2<CR>')
u.map('n', '<C-Right>', '<CMD>vertical resize +2<CR>')
u.map('n', '<C-Left>', '<CMD>vertical resize -2<CR>')

u.map('n', '<leader>vs', '<CMD>vsplit<CR>', { desc = '[v]ertically [s]plit' })
u.map('n', '<leader>hs', '<CMD>split<CR>', { desc = '[h]orizontally [s]plit' })

u.map('n', '<leader>hr', '<C-w>t<C-w>K', { desc = '[h]orizontal [r]otation' })
u.map('n', '<leader>vr', '<C-w>t<C-w>H', { desc = '[v]ertical [r]otation' })

-- EDITING
--u.map('n', 'J', 'mzJ`z')

-- OTHERS
u.map({ "n", "v" }, '<M-U>', 'viwUe', { desc = '[Alt]erate [U]ppercase' })
u.map({ "n", "v" }, '<M-u>', 'viwue', { desc = '[Alt]erate [u]ndercase' })
u.map({ "n", "v" }, '<M-t>', '<ESC>b~le', { desc = '[Alt]erate [t]itlecase' })
u.map('', 'U', '<CMD>redo<CR>')
u.map('n', '<leader>x', '<CMD>!chmod +x %<CR>')
--m('n', '<leader>ra', ':%s/\\<'..vim.fn.expand("<cword>")..'\\>/\\<'..vim.fn.expand("<cword>")..'\\>/gI')
u.map({ 'n', 'v' }, '<C-q><C-g>', function() -- search for <cword> on google
  vim.fn.system({
    'xdg-open',
    'https://google.com/search?q=' .. vim.fn.expand("<cword>") })
end, { desc = '[C-q]uery [C-g]oogle' })

--m('n', '<leader>ra', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>')
----m('n', '<leader>=', 'gg=G')

-- za toggle folds
-- :%s/<name>/<newname>/gc
