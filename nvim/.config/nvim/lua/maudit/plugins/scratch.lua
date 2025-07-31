local filetypes = {
  { text = "css" },
  { text = "txt" },
  { text = "go" },
  { text = "html" },
  { text = "javascript" },
  { text = "javascriptreact" },
  { text = "lua" },
  { text = "markdown" },
  { text = "python" },
  { text = "rust" },
  { text = "typescript" },
  { text = "typescriptreact" },
  { text = "zig" },
}

return {
  "folke/snacks.nvim",
  keys = {
    {
      "-",
      function()
        require("maudit.utils.scratch").new_scratch(filetypes)
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "_",
      function()
        require("maudit.utils.scratch").select_scratch()
      end,
      desc = "Select Scratch Buffer",
    },
  },
}
