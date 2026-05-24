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

      -- vim.lsp.config('ts_ls', {})
      vim.lsp.config('ts_ls', {
        filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        settings = {
          typescript = {
            suggest = {
              autoImports = true,
              includeCompletionsForImportStatements = true,
            },
          },
          javascript = {
            suggest = {
              autoImports = true,
              includeCompletionsForImportStatements = true,
            },
          },
        },
        init_options = {
          preferences = {
            quotePreference = "single",
            importModuleSpecifierPreference = "relative",
          },
        },
      })
      vim.lsp.enable('ts_ls')

      -- Format on save for all file types with a lsp
      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   callback = function(args)
      --     local client = vim.lsp.get_client_by_id(args.data.client_id)
      --     if not client then return end
      --
      --     vim.api.nvim_create_autocmd('BufWritePre', {
      --       buffer = args.buf,
      --       callback = function()
      --         vim.lsp.buf.format({ bufnr = args.buf })
      --       end,
      --     })
      --   end
      -- })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'cpp',
        callback = function()
          vim.lsp.start({
            name = 'clangd',
            cmd = { 'clangd' },
          })
        end,
      })
      vim.lsp.enable('clang')
    end,
  }
}
