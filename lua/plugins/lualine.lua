return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		local colors = {
			bg = "#282828",
			fg = "#e4e4ef",
			yellow = "#ffdd33",
			red = "#f43841",
			green = "#73c936",
			blue = "#96a6c8",
			grey = "#484848",
			dark_grey = "#101010",
		}
		local navic = require("nvim-navic")

		local navic_component = {
			function()
				return navic.get_location()
			end,
			cond = function()
				return navic.is_available()
			end,
			color = { fg = "#ffdd33" }, -- Using the Gruber Yellow
		}

		local my_lualine_theme = {
			normal = {
				a = { fg = colors.dark_grey, bg = colors.yellow, gui = "bold" },
				b = { fg = colors.fg, bg = colors.grey },
				c = { fg = colors.fg, bg = colors.bg },
			},
			insert = {
				a = { fg = colors.dark_grey, bg = colors.green, gui = "bold" },
				b = { fg = colors.fg, bg = colors.grey },
				c = { fg = colors.fg, bg = colors.bg },
			},
			visual = {
				a = { fg = colors.dark_grey, bg = colors.blue, gui = "bold" },
				b = { fg = colors.fg, bg = colors.grey },
				c = { fg = colors.fg, bg = colors.bg },
			},
			replace = {
				a = { fg = colors.dark_grey, bg = colors.red, gui = "bold" },
				b = { fg = colors.fg, bg = colors.grey },
				c = { fg = colors.fg, bg = colors.bg },
			},
			inactive = {
				a = { fg = colors.grey, bg = colors.bg, gui = "bold" },
				b = { fg = colors.grey, bg = colors.bg },
				c = { fg = colors.grey, bg = colors.bg },
			},
		}

		local mode = {
			"mode",
			fmt = function(str)
				-- return ' '
				-- displays only the first character of the mode
				return " " .. str
			end,
		}

		local diff = {
			"diff",
			colored = true,
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.yellow },
				removed = { fg = colors.red },
			},
			symbols = { added = " ", modified = " ", removed = " " },
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
			-- Make the filename stand out slightly
			color = { fg = colors.fg, gui = "bold" },
		}

		-- Changed the hardcoded hex to Gruber Yellow
		local branch = { "branch", icon = { "", color = { fg = colors.yellow } }, color = { fg = colors.fg } }

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = my_lualine_theme,
				-- Emacs Style: Minimal internal dividers, no powerline arrows on edges
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename, navic_component},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.yellow },
					},
					{ "filetype" },
				},
			},
		})
	end,
}
