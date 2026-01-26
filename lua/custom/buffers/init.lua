local telescope_builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')

local M = {}

function M.open()
	telescope_builtin.buffers({
		initial_mode = 'normal',
		attach_mappings = function(prompt_bufnr, map)
			local delete_buf = function()
				local current_picker = action_state.get_current_picker(prompt_bufnr)
				current_picker:delete_selection(function(selection)
					vim.api.nvim_buf_delete(selection.bufnr, { force = true })
				end)
			end

			map('n', '<C-x>', delete_buf)

			return true
		end
	})
end

return M
