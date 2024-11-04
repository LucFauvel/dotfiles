return {
  'jay-babu/mason-nvim-dap.nvim',
  version = "*",
  dependencies = {
    'mfussenegger/nvim-dap',
  },
	config = function()
    local keymap = vim.keymap -- for conciseness
    local opts = { silent = true }

    require('mason-nvim-dap').setup({
      ensure_installed = {'netcoredbg'}
    })

    local dap = require('dap')

    keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
    keymap.set("n", "<F5>", dap.continue, opts)
    keymap.set("n", "<F10>", dap.step_over, opts)
    keymap.set("n", "<F11>", dap.step_into, opts)
    keymap.set("n", "<F12>", dap.step_out, opts)
    keymap.set("n", "<leader>r", dap.repl.open, opts)
    keymap.set("n", "<leader>rl", dap.run_last, opts)
  end
}
