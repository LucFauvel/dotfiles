require("config.lazy")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.wo.number = true

options = { noremap = true }

vim.api.nvim_set_keymap('n', '<Tab>', ":bnext", options)
vim.api.nvim_set_keymap('n', '<S-Tab>', ":bprev", options)

require("nvim-tree").setup()
require("bufferline").setup()
require("lualine").setup { options = { theme = 'ayu_dark' } }

vim.cmd [[
   highlight Normal guibg=none
   highlight NonText guibg=none
   highlight Normal ctermbg=none
   highlight NonText ctermbg=none
]]

