local M = {}

local pywal_cache_file = os.getenv("HOME") .. "/.cache/wal/sequences"
local last_mod_time = 0

local function Transparent()
  vim.cmd.colorscheme("pywal")
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  if package.loaded["lualine"] then
    -- NOTA: Ricaricare Lualine con setup() dopo l'aggiornamento
    -- assicura che i colori Pywal aggiornati vengano prelevati.
    require("lualine").setup({
      options = {
        theme = "auto",
      },
    })
  end
end

-- 🔥 CORREZIONE 1: Definisci la funzione M.check_and_reload QUI
M.check_and_reload = function()
  if vim.fn.filereadable(pywal_cache_file) == 1 then
    local current_mod_time = vim.fn.getftime(pywal_cache_file)
    if current_mod_time > last_mod_time then
      Transparent()
      last_mod_time = current_mod_time
    end
  end
end

-- 🔥 CORREZIONE 2: Ora M.check_and_reload è definita e può essere usata.
vim.api.nvim_create_autocmd({ "VimResume", "FocusGained" }, {
  callback = M.check_and_reload,
})

-- 🔥 AGGIUNTA NECESSARIA: Esegui all'avvio per impostare last_mod_time e i colori iniziali
M.check_and_reload()

return M
