-- return {
--   "AlphaTechnolog/pywal.nvim",
--   name = "pywal",
--   config = function()
--     local pywal_cache_file = os.getenv("HOME") .. "/.cache/wal/colors"
--     local last_mod_time = 0
--     vim.cmd("colorscheme pywal")
--     -- NOTE: function for transparency
--     function Transparent(color)
--       color = color or "pywal"
--       vim.cmd.colorscheme(color)
--       vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     end
--     Transparent()
--     function CheckAndUpdateWal()
--       if vim.fn.filereadable(pywal_cache_file) == 1 then
--         local stat = vim.fn.getftime(pywal_cache_file)
--         local current_mod_time = stat
--         if current_mod_time > last_mod_time then
--           vim.cmd("colorscheme pywal")
--           Transparent()
--           last_mod_time = current_mod_time
--         end
--       end
--     end
--     CheckAndUpdateWal()
--     vim.api.nvim_create_autocmd({ "VimResume", "FocusGained" }, {
--       callback = CheckAndUpdateWal,
--     })
--   end,
-- }
return {
  "AlphaTechnolog/pywal.nvim",
  name = "pywal",
  config = function()
    -- Carica il modulo che contiene la logica del file watcher
    local wal_monitor = require("maudit.plugins.utils.wal_monitor")
    wal_monitor.check_and_reload()

    vim.api.nvim_create_autocmd({ "VimResume", "FocusGained" }, {
      callback = wal_monitor.check_and_reload,
    })

    -- Non è più necessaria la funzione Transparent qui
  end,
}
