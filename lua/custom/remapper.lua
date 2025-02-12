local M = {}

M.remaps = {}
M.win_id = nil
M.buf_id = nil

function M.add_remap(mode, lhs, rhs, description, tags)
	vim.keymap.set(mode, lhs, rhs)

	table.insert(M.remaps, {
		mode = mode,
		lhs = lhs,
		rhs = rhs,
		description = description,
		tags = tags or {},
	})
end

function M.toggle_help()
	if M.win_id and vim.api.nvim_win_is_valid(M.win_id) then
		vim.api.nvim_win_close(M.win_id, true)
		M.win_id = nil
		M.buf_id = nil
		return
	end

	M.buf_id = vim.api.nvim_create_buf(false, true)
	M.win_id = vim.api.nvim_open_win(M.buf_id, true, {
		relative = "editor",
		width = 80,
		height = 25,
		row = 5,
		col = 5,
		style = "minimal",
		border = "rounded",
	})

	vim.api.nvim_buf_set_option(M.buf_id, "modifiable", true)
	vim.api.nvim_buf_set_option(M.buf_id, "bufhidden", "wipe")

	local tags = {}
	for _, remap in ipairs(M.remaps) do
		if type(remap.tags) == "string" then
			remap.tags = { remap.tags }
		end
		for _, tag in ipairs(remap.tags or {}) do
			if not tags[tag] then
				tags[tag] = {}
			end
			table.insert(tags[tag], remap)
		end
	end

	local lines = { "Remapper Help", "" }
	local highlights = {}

	table.insert(highlights, { 0, 0, -1, "Title" })

	local line_index = 2
	for tag, remaps in pairs(tags) do
		table.insert(lines, tag)
		table.insert(highlights, { line_index, 0, -1, "Keyword" })
		line_index = line_index + 1

		table.insert(lines, "──────────────────────────────────────────────────")
		line_index = line_index + 1

		for _, remap in ipairs(remaps) do
			local formatted_line = string.format(
			" %-30s [%s] ",
			remap.description,
			remap.lhs
			)
			table.insert(lines, formatted_line)

			table.insert(highlights, { line_index, 1, 30, "String" })
			table.insert(highlights, { line_index, 31, 50, "Function" })
			line_index = line_index + 1
		end

		table.insert(lines, "")
		line_index = line_index + 1
	end

	vim.api.nvim_buf_set_lines(M.buf_id, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(M.buf_id, "modifiable", false)

	for _, hl in ipairs(highlights) do
		vim.api.nvim_buf_add_highlight(M.buf_id, -1, hl[4], hl[1], hl[2], hl[3])
	end

	vim.keymap.set("n", "q", function()
		M.toggle_help()
	end, { buffer = M.buf_id, nowait = true, noremap = true, silent = true })
end

vim.api.nvim_create_user_command("RemapHelp", function()
	M.toggle_help()
end, {})

vim.keymap.set("n", "<leader>h", function()
	M.toggle_help()
end)

return M
