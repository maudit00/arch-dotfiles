return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "yavorski/lualine-macro-recording.nvim" },
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "pywal_theme",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_y = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_x = {
          { "branch" },
          { "searchcount" },
        },
        lualine_a = {
          { "macro_recording", "%S" },
          { "filename", path = 1 },
          { "diagnostics" },
        },
        lualine_b = {
          { "diff", symbols = { added = " ", modified = "柳", removed = " " } },
        },
      },
    })
  end,
}
