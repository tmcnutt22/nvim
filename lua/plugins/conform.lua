return {
  {
    'stevearc/conform.nvim',
    enabled = true,
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },  -- Just "prettier" will use project-local
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          python = { "isort", "black" },
          go = { "gofmt", "goimports" },
          rust = { "rustfmt" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
        },
        formatters = {
          prettier = {
            -- Use project-local prettier if available, fallback to global
            prepend_args = { "--config-precedence", "prefer-file" },
            -- Or be more explicit:
            -- command = "npx",  -- Use npx to run project prettier
            -- args = { "prettier", "--stdin-filepath", "$FILENAME" },
          },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end
  }
}