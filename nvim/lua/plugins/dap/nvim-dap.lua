return {
  'jay-babu/mason-nvim-dap.nvim',
  version = "*",
  dependencies = {
    'mfussenegger/nvim-dap',
  },
	config = function()
    require('mason-nvim-dap').setup({
      ensure_installed = {'netcoredbg'}
    })
  end
}
