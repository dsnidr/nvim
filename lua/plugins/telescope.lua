return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
    }

    -- Enable telescope fzf native (if it was able to be installed, see dependencies)
    pcall(telescope.load_extension, "fzf")

    -- Telescope live-grep in git root
    -- Function to find the git root directory based on the current buffer's path
    local function find_git_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == '' then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ':h')
      end

      -- Find the Git root directory from the current file's path
      local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
      if vim.v.shell_error ~= 0 then
        print 'Not a git repository. Searching on current working directory'
        return cwd
      end
      return git_root
    end

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = find_git_root()
      if git_root then
        builtin.live_grep = {
          search_dirs = { git_root },
        }
      end
    end

    vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

    -- Keymaps --
    vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
    vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>/", function()
      -- Additional config fields can be passed to change the theme, layout, etc
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = "[/] Fuzzy search in current buffer" })
    
    local function telescope_live_grep_open_files()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      }
    end

    local telescope_key = "f"
    vim.keymap.set("n", "<leader>" .. telescope_key .. "/", telescope_live_grep_open_files, { desc = "[S]earch [/] in open files" })
    vim.keymap.set("n", "<leader>" .. telescope_key .. "s", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    vim.keymap.set("n", "<leader>" .. telescope_key .. "f", builtin.git_files, { desc = "Search [G]it [F]iles" })
    vim.keymap.set("n", "<leader>" .. telescope_key .. "f", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>" .. telescope_key .. "h", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>" .. telescope_key .. "w", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>" .. telescope_key .. "g", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>" .. telescope_key .. "G", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
    vim.keymap.set("n", "<leader>" .. telescope_key .. "d", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>" .. telescope_key .. "r", builtin.resume, { desc = "[S]earch [R]esume" })
  end,
}
