return {
  'jay-babu/mason-nvim-dap.nvim',
  version = "*",
  dependencies = {
    'mfussenegger/nvim-dap',
  },
	config = function()
    local keymap = vim.keymap -- for conciseness

    require('mason-nvim-dap').setup({
      ensure_installed = {'coreclr'}
    })

    local dap = require('dap')

    keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    keymap.set("n", "<leader>c", dap.continue)
    keymap.set("n", "<leader>o", dap.step_over)
    keymap.set("n", "<leader>i", dap.step_into)
    keymap.set("n", "<leader>p", dap.step_out)
    keymap.set("n", "<leader>r", dap.repl.open)
    keymap.set("n", "<leader>rl", dap.run_last)
  end
}
