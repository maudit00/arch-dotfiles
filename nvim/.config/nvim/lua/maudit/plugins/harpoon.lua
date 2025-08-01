return {
  "theprimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    require("harpoon").setup({
      global_settings = {
        enter_on_sendcmd = false,
      },
    })
    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    vim.keymap.set("n", "<leader>1", function()
      ui.nav_file(1)
    end)
    vim.keymap.set("n", "<leader>2", function()
      ui.nav_file(2)
    end)
    vim.keymap.set("n", "<leader>3", function()
      ui.nav_file(3)
    end)
    vim.keymap.set("n", "<leader>4", function()
      ui.nav_file(4)
    end)
    vim.keymap.set("n", "<leader>5", function()
      ui.nav_file(5)
    end)
  end,
}
