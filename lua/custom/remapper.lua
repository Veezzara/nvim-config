local M = {}

M.remaps = {}

function M.add_remap(mode, lhs, rhs, description, category)
	vim.keymap.set(mode, lhs, rhs)

	table.insert(M.remaps, {
		mode = mode,
		lhs = lhs,
		rhs = rhs,
		description = description,
		category = category,
	})
end

function M.show_help()
	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = 80,
		height = 20,
		row = 5,
		col = 5,
		style = "minimal",
		border = "rounded",
	})

	local lines = {}
	table.insert(lines, "=== Keybindings ===")
	table.insert(lines, "")

	local categories = {}
	for _, remap in ipairs(M.remaps) do
		if not categories[remap.category] then
			categories[remap.category] = {}
		end
		table.insert(categories[remap.category], remap)
	end

	for category, remaps in pairs(categories) do
		table.insert(lines, string.format("== %s ==", category))
		for _, remap in ipairs(remaps) do
			table.insert(lines, string.format("%s -> %s (%s)", remap.lhs, remap.rhs, remap.description))
		end
		table.insert(lines, "")
	end

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	vim.keymap.set("n", "q", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buf })
end

vim.api.nvim_create_user_command("RemapHelp", function()
	M.show_help()
end, {})

vim.keymap.set("n", "<leader>h", ":RemapHelp<CR>")

return M
