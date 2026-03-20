return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			default_format_opts = {
				lsp_fallback = true,
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				htmlangular = { "prettier_angular" },
				svelte = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				-- python = { "black" },
				markdown = { "mdformat", "markdown-toc" },
				-- ["markdown.mdx"] = { "prettier", "markdownlint", "markdown-toc" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		-- Configure individual formatters
		local function find_prettier(start_path)
			local path = start_path
			while path ~= "/" do
				local prettier_path = path .. "/node_modules/.bin/prettier"
				if vim.fn.executable(prettier_path) == 1 then
					return prettier_path
				end
				path = vim.fn.fnamemodify(path, ":h")
			end
			return "prettier"
		end

		conform.formatters.prettier = {
			command = function(ctx)
				return find_prettier(vim.fn.fnamemodify(ctx.filename, ":p:h"))
			end,
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		}
		conform.formatters.prettier_angular = {
			command = function(ctx)
				return find_prettier(vim.fn.fnamemodify(ctx.filename, ":p:h"))
			end,
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--parser",
				"angular",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		}
		conform.formatters.shfmt = {
			prepend_args = { "-i", "4" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format whole file or range (in visual mode) with" })
	end,
}
