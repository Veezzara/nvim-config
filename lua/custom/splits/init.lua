local M = {}

function M.resize(direction)
	local amount = 2
	local is_edge = {
		bottom = vim.fn.winnr('j') == vim.fn.winnr(),
		right = vim.fn.winnr('l') == vim.fn.winnr(),
	}
	local cmds = {
		up    = is_edge.bottom and ('resize +' .. amount) or ('resize -' .. amount),
		down  = is_edge.bottom and ('resize -' .. amount) or ('resize +' .. amount),
		left  = is_edge.right  and ('vertical resize +' .. amount) or ('vertical resize -' .. amount),
		right = is_edge.right  and ('vertical resize -' .. amount) or ('vertical resize +' .. amount),
	}
	vim.cmd(cmds[direction])
end

return M
