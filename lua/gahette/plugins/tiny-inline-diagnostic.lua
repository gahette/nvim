return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
			options = {
				enable_on_insert = false,
				show_source = true,
				throttle = 100,
			},
			signs = {
				left = "▎",
				right = "▎",
				diag = "●",
				arrow = "➤",
				up_arrow = "↑",
				down_arrow = "↓",
				vertical = "│",
				horizontal = "─",
			},
			highlights = {
				background = "#1e1e2e",
				foreground = "#cdd6f4",
				error = "#f38ba8",
				warn = "#fab387",
				info = "#89b4fa",
				hint = "#a6e3a1",
			},
		})

		-- Désactiver le virtual_text par défaut pour éviter les conflits
		vim.diagnostic.config({
			virtual_text = false,
			underline = true,
			update_in_insert = false,
		})
	end,
}
