vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})

local telescope = require('telescope.builtin')

-- Create a custom function for searching in the current directory
local function find_files_in_current_directory()
  telescope.find_files({
    cwd = vim.fn.expand('%:p:h'), -- Set the current working directory to the file's directory
    prompt_title = "Find Files in Current Directory",
  })
end

-- Map the custom function to a keybinding, e.g., <leader>ff
vim.api.nvim_set_keymap('n', '<leader>ff', ':lua find_files_in_current_directory()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "blade",
  callback = function()
    vim.bo.commentstring = "{{-- %s --}}"
  end,
})
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
