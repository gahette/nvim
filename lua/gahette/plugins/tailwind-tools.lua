return {
	-- Utilisé uniquement par nvim-cmp
	"roobert/tailwindcss-colorizer-cmp.nvim",

	-- Couleurs Tailwind dans le buffer
	{
		"NvChad/nvim-colorizer.lua",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			user_default_options = {
				tailwind = true,
			},
			filetypes = {
				"html",
				"css",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"jsx",
				"tsx",
				"vue",
				"svelte",
				"astro",
			},
		},
	},

	-- Tri automatique des classes Tailwind
	{
		"y3owk1n/tailwind-autosort.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("tailwind-autosort").setup({
				on_save_enabled = true,
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"jsx",
					"tsx",
					"vue",
					"svelte",
					"astro",
				},
			})

			vim.api.nvim_create_user_command("TailwindSort", function()
				require("tailwind-autosort").sort()
			end, {})
		end,
	},
}
