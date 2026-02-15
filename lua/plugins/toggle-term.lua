return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          else
            -- For float, use 90% of screen
            return math.floor(vim.o.lines * 0.9)
          end
        end,
        open_mapping = [[<c-\>]], -- Ctrl+\ to toggle terminal
        hide_numbers = true,      -- Hide the number column in terminal buffer
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = -30,   -- Make terminal DARKER (negative number) or lighter
        start_in_insert = true,
        insert_mappings = true, -- Allow mappings in insert mode
        persist_size = true,
        direction = 'float',    -- Floating window
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = 'curved',                        -- or 'single', 'double', 'shadow', 'curved'
          winblend = 10,                            -- Makes it slightly transparent (0-100)
          width = function()
            return math.floor(vim.o.columns * 0.95) -- 95% width
          end,
          height = function()
            return math.floor(vim.o.lines * 0.9) -- 90% height
          end,
          highlights = {
            border = "Normal",
            background = "NormalFloat", -- Different background color
          }
        }
      })
    end
  }
}
