require("config.lazy")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.fileformats = "unix,dos,mac"

local options = { noremap = true, nowait = true }

vim.api.nvim_set_keymap('n', '<Tab>', ":bnext<CR>", options)
vim.api.nvim_set_keymap('n', '<S-Tab>', ":bprev<CR>", options)
vim.api.nvim_set_keymap('n', 'oo', ":NvimTreeToggle<CR>", options)
vim.api.nvim_set_option("clipboard", "unnamed")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- git blame toggle
vim.keymap.set('n', '<leader>gb', ":GitBlameToggle<CR>", options)

-- format
vim.keymap.set("n", "<Leader>lf", function()
	vim.lsp.buf.format()
end, { desc = "Format buffer" })

-- lazygit
vim.keymap.set("n", "<Leader>gg", "<cmd>silent !tmux neww lazygit<cr>", { desc = "Open lazygit in tmux" })
vim.keymap.set("n", "<Leader>d", '"_d', { desc = "Delete to void" })

vim.cmd 'set expandtab'
vim.cmd 'set tabstop=2'
vim.cmd 'set shiftwidth=2'

-- tmux
vim.keymap.set("n", "<C-n>", function()
	vim.fn.system("tmux switch-client -n")
end, { desc = "Switch tmux session forward" })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>", { desc = "Open tmux sessionizer" })

vim.keymap.set("n", "<C-p>", function()
	vim.fn.system("tmux switch-client -p")
end, { desc = "Switch tmux session back" })

require("bufferline").setup()
require("lualine").setup {
	options = {
		theme = 'ayu_dark'
	},
	sections = {
	  lualine_a = {'mode'},
	  lualine_b = {'branch', 'diff', 'diagnostics'},
	  lualine_c = { { 'filename', path = 2 } },
	  lualine_x = {'encoding', 'fileformat', 'filetype'},
	  lualine_y = {'progress'},
	  lualine_z = {'location'}
	},
}
