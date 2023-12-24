return {
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        lsp_document_formatting = true,

      })

      vim.keymap.set("n", "<leader>god", ":Neotree close | :GoDebug <cr>", { desc = "Starts a go debug session, also closes neotree to prevent issues" })
      vim.keymap.set("n", "<leader>godt", ":Neotree close | :GoDebug -t<cr>", { desc = "Starts a go debug session (test mode), also closes neotree to prevent issues" })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  }
}
