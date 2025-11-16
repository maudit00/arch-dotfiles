return {
  {
    "lambdalisue/suda.vim",
    config = function()
      local keymap = vim.keymap
      keymap.set("n", "<leader>cr", "<cmd>SudaRead<CR>", { desc = "Suda Read" })
      keymap.set("n", "<leader>cw", "<cmd>SudaWrite<CR>", { desc = "Suda Write" })
    end,
  },
}
