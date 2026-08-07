return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		-- mason-lspconfig handles the LSP servers above; this covers the
		-- standalone formatters conform.nvim shells out to.
		opts = {
			ensure_installed = { "stylua", "prettier" },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		-- mason-lspconfig installs these via mason and calls vim.lsp.enable()
		-- for each one automatically once installed.
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"tailwindcss",
				"terraformls",
				"html",
				"cssls",
			},
		},
	},
	{
		-- Only used for its bundled `lsp/*.lua` server configs on the
		-- runtimepath; there is no `require('lspconfig').setup{}` call.
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			-- Not Mason-managed: rely on the rbenv shim for `ruby-lsp` so it
			-- resolves to the Ruby/gem set selected by the project's
			-- .ruby-version instead of Mason's own bundled install.
			vim.lsp.config("ruby_lsp", {
				cmd = { "ruby-lsp" },
				root_markers = { ".ruby-version", "Gemfile", ".git" },
				init_options = {
					formatter = "auto",
					linters = { "rubocop" },
				},
			})
			vim.lsp.enable("ruby_lsp")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("felipecvo-lsp-attach", { clear = true }),
				callback = function(args)
					local opts = { buffer = args.buf, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})
		end,
	},
}
