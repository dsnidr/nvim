return {
  {
    "akinsho/bufferline.nvim",
    tag = "v4.4.1",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "ojroques/nvim-bufdel",
    },
    config = function()
      vim.opt.termguicolors = true

      local bufferline = require("bufferline")
      bufferline.setup {
        options = {
          style_preset = {
            bufferline.style_preset.no_italic,
            -- bufferline.style_preset.no_bold,
          },
        },
      }

      require("bufdel").setup {
        next = "tabs",
        quit = true, -- quit when last buffer is closed
      }

      vim.keymap.set("n", "<leader>x", ":BufDel<cr>", { desc = "Closes the current buffer", silent = true })
      vim.keymap.set("n", "<tab>", ":bn<cr>", { desc = "Next buffer", silent = true })
      vim.keymap.set("n", "<S-tab>", ":bp<cr>", { desc = "Previous buffer", silent = true })
    end,
  },
}
