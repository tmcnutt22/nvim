return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Configure lua_ls
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })

      -- Enable LSP
      vim.lsp.enable('lua_ls')
      -- Configure gopls (Go)
      vim.lsp.config('gopls', {
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })

      -- Enable gopls
      vim.lsp.enable('gopls')
      vim.lsp.config('ts_ls', {}) -- TypeScript, minimal config
      vim.lsp.enable('ts_ls')

      -- Format on save for all file types with a lsp
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf })
            end,
          })
        end
      })
    end,
  }
}
