require("config.lazy")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.wo.number = true

options = { noremap = true, nowait = true }

vim.api.nvim_set_keymap('n', '<Tab>', ":bnext<CR>", options)
vim.api.nvim_set_keymap('n', '<S-Tab>', ":bprev<CR>", options)
vim.api.nvim_set_keymap('n', 'oo', ":NvimTreeToggle<CR>", options)
vim.api.nvim_set_option("clipboard", "unnamed")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- format
vim.keymap.set("n", "<Leader>lf", function()
	vim.lsp.buf.format()
end, { desc = "Format buffer" })

-- lazygit
vim.keymap.set("n", "<Leader>gg", "<cmd>silent !tmux neww lazygit<cr>", { desc = "Open lazygit in tmux" })

vim.bo.tabstop = 4

require("nvim-tree").setup()
require("bufferline").setup()
require("lualine").setup { options = { theme = 'ayu_dark' } }
