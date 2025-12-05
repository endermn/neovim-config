return {
	-- Surround
	{
		"echasnovski/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			custom_surroundings = nil,

			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 300,

			-- Module mappings. Use `''` (empty string) to disable one.
			-- INFO:
			-- saiw surround with no whitespace
			-- saw surround with whitespace
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "ds", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},

			n_lines = 20,

			-- Whether to respect selection type:
			-- - Place surroundings on separate lines in linewise mode.
			-- - Place surroundings on each line in blockwise mode.
			respect_selection_type = false,

			-- How to search for surrounding (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			-- see `:h MiniSurround.config`.
			search_method = "cover",

			-- Whether to disable showing non-error feedback
			silent = false,
		},
	},
	-- {
	-- 	"echasnovski/mini.trailspace",
	-- 	event = { "BufReadPost", "BufNewFile" },
	-- 	config = function()
	-- 		local miniTrailspace = require("mini.trailspace")
	--
	-- 		miniTrailspace.setup({
	-- 			only_in_normal_buffers = true,
	-- 		})
	-- 		vim.keymap.set("n", "<leader>cw", function()
	-- 			miniTrailspace.trim()
	-- 		end, { desc = "Erase Whitespace" })
	--
	-- 		vim.api.nvim_create_autocmd("CursorMoved", {
	-- 			pattern = "*",
	-- 			callback = function()
	-- 				require("mini.trailspace").unhighlight()
	-- 			end,
	-- 		})
	-- 	end,
	-- },
}
