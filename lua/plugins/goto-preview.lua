return {
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup {}

      local basecmd = "<cmd>lua require('goto-preview')."
      vim.keymap.set("n", "<leader>gp", basecmd .. "goto_preview_definition()<cr>", { noremap=true })
      vim.keymap.set("n", "<leader>gP", basecmd .. "close_all_win()<cr>", { noremap=true })
    end,
  }
}
