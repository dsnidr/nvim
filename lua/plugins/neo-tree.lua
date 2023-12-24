return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "muniftanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup {
        close_if_last_window = true,
        default_component_configs = {
          indent = {
            padding = 1,
          },
        },
        window = {
          width = 30,
          mappings = {
            ["<space>"] = {
              "toggle_node",
              nowait = true,
            },
            ["<space>"] = {
              "open",
              nowait = true,
            },
          },
        },
      }

      vim.keymap.set("n", "<c-n>", ":Neotree toggle<cr>", {})
      -- vim.keymap.set("n", "<c-n>", ":neotree filesystem reveal left<cr>", {})
      -- vim.keymap.set("n", "<c-r>", ":neotree filesystem reveal right<cr>", {})
    end,
  },
}
