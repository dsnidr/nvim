return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
      -- Defer until after first render to improve startup time when opening a file
      vim.defer_fn(function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup {
          modules = {},
          sync_install = true,
          ignore_install = {},
          ensure_installed = {
            -- Base
            "lua",
            "vim",
            "vimdoc",
            "bash",

            -- Additions
            "go",
            "javascript",
            "typescript",
            "markdown",
            "json",
            "http",
          },
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<C-space>",
              node_incremental = "<C-space>",
              scope_incremental = "<C-s>",
              node_decremental = "<M-space>",
            },
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
              },
            },
            move = {
              enable = true,
              set_jumps = true, -- whether to set jumps in the jumplist
              goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
              },
              goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
              },
              goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
              },
              goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
              },
            },
            swap = {
              enable = true,
              swap_next = {
                ['<leader>a'] = '@parameter.inner',
              },
              swap_previous = {
                ['<leader>A'] = '@parameter.inner',
              },
            },
          },
        }
      end, 0)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      local ctx = require("treesitter-context")
      ctx.setup {
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 1,
        trim_scope = "other",
        mode = "cursor",
        separator = nil,
        zindex = 20,
        on_attach = nil,
      }

      vim.keymap.set("n", "[c", function()
       ctx.go_to_context(vim.v.count1)
      end, { silent = true })
    end,
  }
}
