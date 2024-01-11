return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("trouble").setup {

      }

      vim.keymap.set("n", "<leader>tt", ":TroubleToggle<cr>", { desc = "Toggles trouble" } )
      vim.keymap.set("n", "<leader>td", ":TroubleToggle document_diagnostics<cr>", { desc = "Toggles trouble document diagnostics" } )
      vim.keymap.set("n", "<leader>tw", ":TroubleToggle workspace_diagnostics<cr>", { desc = "Toggles trouble workspace diagnostics" } )
      vim.keymap.set("n", "<leader>tr", ":TroubleRefresh<cr>", { desc = "Manually refreshes trouble" })
    end,
  },
}
