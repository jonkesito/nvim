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
        ensure_installed = { "lua_ls", "cssls", "html", "tsserver", "tailwindcss", "volar", "sqlls", "jsonls" },
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

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.html.setup({
        capabilities = capabilities,
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

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
