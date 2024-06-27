local utils = require("user.core.utils")
return {
	"vim-test/vim-test",
	dependencies = { "preservim/vimux" },
	--cmd = {"TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit", "TestClass"},
	utils.map("n", "<leader>tn", ":TestNearest<CR>", {desc= "[T]est [N]earest"}),
	utils.map("n", "<leader>tf", ":TestFile<CR>", {desc= "[T]est [F]ile"}),
	utils.map("n", "<leader>ts", ":TestSuite<CR>", {desc= "[T]est [S]uit"}),
	utils.map("n", "<leader>tl", ":TestLast<CR>", {desc= "[T]est [L]ast"}),
	utils.map("n", "<leader>tc", ":TestClass<CR>", {desc= "[T]est [C]lass"}),	
	--utils.map("n", "<leader>", ":TestVisit<CR>")

	vim.cmd("let test#strategy = 'vimux'"),
	vim.cmd("let g:test#preserve_screen = 1"),
	vim.cmd("let g:test#echo_command = 0"),
}
