return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "cssls", "html", "ts_ls", "tailwindcss", "volar", "sqlls", "jsonls" },
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
			-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { buffer = bufnr, desc = "Diagnostic to local list" })
			--

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({

				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/opt/homebrew/lib/node_modules/@vue/typescript-plugin",
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
			})

			-- You must make sure volar is setup
			-- e.g. require'lspconfig'.volar.setup{}
			-- See volar's section for more information

			lspconfig.volar.setup({
				filetypes = {
					"typescript",
					"javascript",
					"javascriptreact",
					"typescriptreact",
					"vue",
					"json",
					"html",
					"css",
					"scss",
				},
				init_options = {
          vue = {
            hybridMode = true,
          },
					typescript = {
						tsdk = "/Users/jonkibook/.nvm/versions/node/v21.7.1/lib/node_modules/typescript/lib",
					},
				},
				capabilities = capabilities,
			})

			local on_attach = function(client, bufnr)
				-- other stuff --
				require("tailwindcss-colors").buf_attach(bufnr)
			end

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})

			local configs = require("lspconfig/configs")
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			lspconfig.emmet_ls.setup({
				-- on_attach = on_attach,
				capabilities = capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"vue",
					"pug",
					"typescriptreact",
				},
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				},
			})
		end,
	},
}
