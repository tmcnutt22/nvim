return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = 'master',
    config = function()
      require 'nvim-treesitter.configs'.setup({
        ensure_installed = { "go", "lua", "javascript", "typescript" },
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  }
}
