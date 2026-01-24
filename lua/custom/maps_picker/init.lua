local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local themes = require('telescope.themes')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local entry_display = require('telescope.pickers.entry_display')
local maps = require('custom.remapper').maps

local M = {}

function M.pick(opts)
	opts = opts or themes.get_dropdown()

	local lhs_max_length = 0
	for i, v in ipairs(maps) do
		local length = string.len(v.lhs)
		print(length)
		if (length > lhs_max_length) then
			lhs_max_length = length
		end
	end


	local displayer = entry_display.create({
		separator = ' | ',
		items = {
			{ width = lhs_max_length },
			{ remaining = true }
		}
	})

	local make_display = function(entry)
		return displayer({
			entry.lhs,
			entry.desc
		})
	end

	pickers.new(opts, {
		finder = finders.new_table {
			results = maps,
			entry_maker = function(entry)
				local lhs = entry.lhs
				local rhs = entry.rhs
				opts = entry.opts or {}

				local desc = opts.desc

				if not desc or desc == '' then
					if type(rhs) == 'function' then
						desc = '<function>'
					else
						desc = rhs
					end
				end

				return {
					value = entry,
					display = make_display,
					ordinal = lhs .. desc,
					lhs = lhs,
					desc = desc
				}
			end
		},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				vim.api.nvim_feedkeys(
					vim.api.nvim_replace_termcodes(selection.value.lhs, true, false, true),
					't',
					true)
			end)
			return true
		end,
	}):find()
end

return M
