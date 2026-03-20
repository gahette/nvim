return {
	"gelguy/wilder.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"romgrk/fzy-lua-native",
	},
	lazy = false,
	config = function()
		-- désactiver le backend Python
		vim.g.wilder_use_python = 0

		local wilder = require("wilder")

		wilder.setup({ modes = { ":", "/", "?" } })

		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				min_width = "20%",
				max_height = "15%",
				reverse = 0,
				highlighter = wilder.lua_fzy_highlighter(), -- <-- 100% Lua
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
