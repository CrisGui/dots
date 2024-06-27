local u = require("user.core.utils")
return {
  "vim-test/vim-test",
  dependencies = { "preservim/vimux" },
  --cmd = {"TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit", "TestClass"},
  u.map("n", "<F1>", "<cmd>TestSuite<CR>", { desc = "[T]est [S]uit" }),
  u.map("n", "<F2>", "<cmd>TestFile<CR>", { desc = "[T]est [F]ile" }),
  u.map("n", "<F3>", "<cmd>TestNearest<CR>", { desc = "[T]est [N]earest" }),
  u.map("n", "<F4>", "<cmd>TestLast<CR>", { desc = "[T]est [L]ast" }),

  vim.cmd("let test#strategy = 'vimux'"),
  vim.cmd("let g:test#preserve_screen = 1"),
  vim.cmd("let g:test#echo_command = 0"),
}
