return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup {
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          }
        },
        highlights = {
          winbar = {
            focused = {
              fg = "#ffffff",
              bg = "#000000",
              bold = true,
            },
            unfocused = {
              fg = "#ff0000",
              bg = "#ffff00",
              bold = true,
            }
          }
        }
      }
    end,
  },
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
        close_if_last_window = false,
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
              "open_with_window_picker",
              nowait = true,
            },
            ["s"] = "vsplit_with_window_picker",
            ["S"] = "split_with_window_picker",
          },
        },
      }

      vim.keymap.set("n", "<c-n>", ":Neotree toggle<cr>", {})
      -- vim.keymap.set("n", "<c-n>", ":neotree filesystem reveal left<cr>", {})
      -- vim.keymap.set("n", "<c-r>", ":neotree filesystem reveal right<cr>", {})
    end,
  },
}
