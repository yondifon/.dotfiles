-- lua/plugins/lspconfig.lua
return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "mason-org/mason.nvim", opts = { ui = { height = 0.8 } } },
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			ensure_installed = {
				"gopls",
				"vtsls",
				"vue_ls",
				"tailwindcss",
				"jsonls",
				"pyright",
				"lua_ls",
				"docker-compose-language-service",
				"intelephense",
				"stylua",
			},
			automatic_enable = true,
			ui = {
				check_outdated_packages_on_open = false,
			},
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
				float = { source = true },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},
			})

			-- 3. Keymaps (Applied globally via Autocmd for cleaner code)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local map = function(m, lhs, rhs)
						vim.keymap.set(m, lhs, rhs, { buffer = bufnr, silent = true })
					end

					map("n", "K", vim.lsp.buf.hover)
					map("n", "gd", ":Telescope lsp_definitions<CR>")
					map("n", "gi", ":Telescope lsp_implementations<CR>")
					map("n", "gr", ":Telescope lsp_references<CR>")
					map("n", "<Leader>rn", vim.lsp.buf.rename)
					map("n", "ga", vim.lsp.buf.code_action)
					map("n", "<Leader>.", vim.lsp.buf.code_action)
					map("n", "<Leader>d", function()
						vim.diagnostic.open_float(nil, { source = true })
					end)
				end,
			})

			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						analyses = { unusedparams = true },
						staticcheck = true,
					},
				},
			})
			local get_license = function()
				local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
				local content = f:read("*a")
				f:close()
				return string.gsub(content, "%s+", "")
			end

			vim.lsp.config("intelephense", {
				filetypes = { "php", "blade" },
				init_options = { licenceKey = get_license() },
			})

			vim.lsp.enable("intelephense")

			-- vim.lsp.enable("phpactor")
			-- vim.lsp.enable("phpactor")

			-- Global restart keymap
			vim.keymap.set("n", "<Leader>lr", ":LspRestart<CR>", { silent = true })
		end,
	},
	{
		"ricardoramirezr/lali-components.nvim",
		ft = "blade",
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				temp_dir = "/tmp",
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.blade_formatter,
					null_ls.builtins.diagnostics.phpstan,
					null_ls.builtins.formatting.pint,
				},
			})
			vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, {})
		end,
	},
	{
		"adibhanna/laravel.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>la", ":Artisan<cr>", desc = "Laravel Artisan" },
			{ "<leader>lc", ":Composer<cr>", desc = "Composer" },
			{ "<leader>lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
			{ "<leader>lm", ":LaravelMake<cr>", desc = "Laravel Make" },
		},
		config = function()
			require("laravel").setup()
		end,
	},
}
