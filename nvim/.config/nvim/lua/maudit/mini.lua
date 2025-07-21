-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'

-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup({ path = { package = path_package } })

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Safely execute immediately
now(function()
  vim.o.termguicolors = true
end)
now(function()
  require("mini.cursorword").setup()
end)
now(function()
  require("mini.icons").setup()
end)
now(function()
  require("mini.tabline").setup()
end)

-- Safely execute later
later(function()
  require("mini.ai").setup()
end)
later(function()
  require("mini.pick").setup()
end)
later(function()
  require("mini.move").setup()
end)
later(function()
  require("mini.jump").setup()
end)

now(function()
  -- Use other plugins with `add()`. It ensures plugin is available in current
  -- session (installs if absent)
  add({
    source = "neovim/nvim-lspconfig",
    -- Supply dependencies near target plugin
    depends = { "williamboman/mason.nvim" },
  })
end)

later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    -- Use 'master' while monitoring updates in 'main'
    checkout = "master",
    monitor = "main",
    -- Perform action after every checkout
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })
  -- Possible to immediately execute code which depends on the added plugin
  require("nvim-treesitter.configs").setup({
    modules = {},
    ignore_install = { "" },
    auto_install = true,
    sync_install = false,
    ensure_installed = { "lua", "vimdoc" },
    highlight = { enable = true },
  })
end)
