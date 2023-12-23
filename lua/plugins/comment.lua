return {
  {
    "terrortylor/nvim-comment",
    tag = "e9ac16ab056695cad6461173693069ec070d2b23",
    config = function()
      require("nvim_comment").setup {
        line_mapping = "<C-/>"
      }

      -- vim.keymap.set("n", "<C-/>", ":CommentToggle<cr>", { desc = "Toggles code comments on selection" })
    end,
  },
}
