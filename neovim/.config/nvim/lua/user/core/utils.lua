local fn = vim.fn
local M = {}

---Map keybindings with 'noremap' and 'silent' as true by default
---@param mode any
---@param lhs any
---@param rhs any
---@param opts any
function M.map(mode, lhs, rhs, opts)
	local options = {noremap = true, silent = true}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

---Check if neovim is running inside vscode
---@return boolean
function M.is_vscode_running()
  if vim.env.VSCODE then
    return true
  end
  return false
end


return M
