return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      label = {
        rainbow = {
          enabled = true,
          shade = 6,
        },
      },
      highlight = {
        backdrop = true,
        matches = true,
        priority = 5000,
        groups = {
          match = "FlashMatch",
          current = "FlashCurrent",
          backdrop = "FlashBackdrop",
          label = "FlashLabel",
        },
      },
      modes = {
        search = {
          enabled = true,
          highlight = { backdrop = true },
          jump = { history = true, register = true, nohlsearch = true },
        },
        char = {
          enabled = true,
          search = { wrap = false },
          highlight = { backdrop = true },
          jump = { register = false, autojump = true },
        },
      },
    },
  -- stylua: ignore
  keys = {
    { "gs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "gS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "gr", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "gR", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
}
