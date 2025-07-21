return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
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
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "jdtls",
        "lua_ls",
        "emmet_ls",
      },
      -- THIS IS THE CRUCIAL PART YOU'RE MISSING:
      handlers = {
        -- This default handler will set up all installed LSPs
        -- using their default lspconfig.nvim configurations.
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        -- You can add custom handlers for specific servers here
        -- For example, for 'lua_ls' with specific settings:
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = { runtime = { version = "LuaJIT" } },
              diagnostics = {
                globals = { "vim" },
              },
            },
          })
        end,
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
      },
    })
  end,
}
