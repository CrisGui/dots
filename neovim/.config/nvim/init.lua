require "user"

vim.cmd.colorscheme "catppuccin"

if vim.env.VSCODE then
  vim.g.vscode = true
end

--vim.loader = false
if vim.loader then
  vim.loader.enable()
end

--[[
-- Debugging
<F12>       Start Debugging
<F11>       Anonymous Breakpoint
<F10>       Verbose Breakpoint
<F9>        Values Preview
<F8>        Terminate
-- LSP
<F7>        Rename references
<F6>        Format code
<F5>        Code actions
-- Testing
<F4>        Test Last
<F3>        Test Nearest
<F2>        Test File
<F1>        Test Suit
--]]
