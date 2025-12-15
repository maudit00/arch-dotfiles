return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    float = {
      padding = 4,
      border = "rounded",
    },
    columns = {
      "icon",
      "size",
      "mtime",
    },
    view_options = {
      show_hidden = true,
      sort = {
        { "type", "asc" },
        { "mtime", "desc" },
      },
    },
    skip_confirm_for_simple_edits = true,
    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
    },
    watch_for_changes = true,
  },
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
