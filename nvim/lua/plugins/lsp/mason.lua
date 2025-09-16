return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
      automatic_enable = true,
      automatic_installation = true,
			-- list of servers for mason to install
			ensure_installed = {
				"html",
				"cssls",
				"angularls",
				"tailwindcss",
				"lua_ls",
				"rust_analyzer",
				"dockerls",
				"jsonls",
				"docker_compose_language_service",
				"biome",
				"astro",
				"yamlls",
				"graphql",
				"prismals",
        "ts_ls",
        "denols",
        "csharp_ls",
        "powershell_es"
			},
		})

    vim.lsp.config('denols', {
      root_dir = function(...)
        return lspconfig.util.root_pattern("deno.jsonc", "deno.json")(...)
      end,
    })

    vim.lsp.config('rust_analyzer', {
      setting = {
        ["rust-analyzer"] = {
          inlayHints = {
            enable = true,
          },
        },
      },
    })

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d",
			},
		})
	end,
}
