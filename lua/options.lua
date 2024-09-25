require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- file Types
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})
