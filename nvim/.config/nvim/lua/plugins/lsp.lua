return {
  -- Mason: auto-install LSP servers
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "ts_ls",
          "eslint",
          "rust_analyzer",
          "jsonls",
          "html",
          "cssls",
          "ruby_lsp",
        },
      })
    end,
  },
  -- LSP config
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Use vim.lsp.config (nvim 0.11+ native API)
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Enable servers
      local servers = { "pyright", "ts_ls", "eslint", "rust_analyzer", "jsonls", "html", "cssls", "solargraph" }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end

      -- LSP keymaps on attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gy", vim.lsp.buf.type_definition, "Go to type definition")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("gr", vim.lsp.buf.references, "Go to references")
          map("K", vim.lsp.buf.hover, "Hover docs")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>c", vim.lsp.buf.code_action, "Code action")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action (source)")
          map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
          map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
          map("]d", vim.diagnostic.goto_next, "Next diagnostic")
          map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        end,
      })
    end,
  },
}
