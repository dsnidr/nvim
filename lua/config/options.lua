-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false

function no_paste(_)
  return function(_) end
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = no_paste("+"), -- Pasting disabled
    ["*"] = no_paste("*"), -- Pasting disabled
  },
}

vim.keymap.set("n", "<leader>gog", function()
  local result = vim.fn.system("go generate ./...")
  local exit_code = vim.v.shell_error

  if exit_code == 0 then
    vim.notify("Generation complete", vim.log.levels.INFO)
  else
    vim.notify("Generation failed:\n" .. result, vim.log.levels.ERROR)
  end
end, { desc = "Run go generate", silent = true })
