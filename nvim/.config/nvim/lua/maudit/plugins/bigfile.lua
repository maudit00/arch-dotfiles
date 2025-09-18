return {
  "LunarVim/bigfile.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("bigfile").setup()
  end,
}
