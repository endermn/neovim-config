return {
	"gelguy/wilder.nvim",

	cond = not vim.g.vscode,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"romgrk/fzy-lua-native",
	},
	config = function()
		local wilder = require("wilder")

		wilder.setup({ modes = { ":", "/", "?" } })

		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				min_width = "20%",
				max_height = "15%",
				reverse = 0,
				highlighter = {
					wilder.lua_pcre2_highlighter(),
					wilder.lua_fzy_highlighter(),
				},
				highlights = {
					default = wilder.make_hl(
						"WilderPopupMenu",
						"Pmenu",
						{ { a = 1 }, { a = 1 }, { background = "#1E212B" } }
					),
					accent = wilder.make_hl(
						"WilderAccent",
						"Pmenu",
						{ { a = 1 }, { a = 1 }, { foreground = "#58FFD6", background = "#1e1e2e" } }
					),
				},

				border = "single",
			}))
		)
	end,
}
