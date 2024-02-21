return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon.list")

		local function truncate_branch_name(branch)
			if not branch or branch == "" then
				return ""
			end
				return branch
		end

		local function harpoon_component()
			local total_marks = harpoon:list():get_length()

			if total_marks == 0 then
				return ""
			end

			local current_mark = "—"

			local mark_idx = harpoon:list():get_current_index()
			if mark_idx ~= nil then
				current_mark = tostring(mark_idx)
			end
			return string.format("󱡅 %s/%d", current_mark, total_marks)

		end
		require('lualine').setup({
			options = {
				theme = 'dracula',
				icon_enable = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "█", right = "█" },
			},
			sections = {
				lualine_a = {
					{ "branch", icon = "", fmt = truncate_branch_name },
					harpoon_component,
				},
				lualine_b = {
					'buffers'
				}
			}
		})
	end
}


