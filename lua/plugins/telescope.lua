return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          },
          live_grep = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }

      require("telescope").load_extension("fzf")
      vim.keymap.set("n", "<Leader>ff", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<Leader>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set("n", "<Leader>fw", require('telescope.builtin').live_grep)
    end
  }
}
