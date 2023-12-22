return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        size = function(term)
          if term.direction == "horizontal" then 
            return 10
          else
            return vim.o.columns * 0.4
          end
        end,

        open_mapping = [[<C-i>]],
      }
    end
  },
}
