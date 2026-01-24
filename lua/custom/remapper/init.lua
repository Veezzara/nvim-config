local M = {}
M.maps = {}

function M.set_keymap(mode, lhs, rhs, opts)
	table.insert(M.maps, {
		mode = mode,
		lhs = lhs,
		rhs = rhs,
		opts = opts,
	})

	vim.keymap.set(mode, lhs, rhs, opts)
end

return M
