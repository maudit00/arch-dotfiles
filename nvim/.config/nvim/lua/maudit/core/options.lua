vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("autocmd FileType markdown setlocal ft=markdown")
local opt = vim.opt
opt.relativenumber = true
opt.number = true
opt.updatetime = 500
-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false
opt.ruler = true
-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = true
opt.cursorcolumn = false
-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
-- turn off swapfile
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.sidescrolloff = 8
opt.synmaxcol = 400
opt.pumheight = 10
opt.pumblend = 10
opt.autoread = true
opt.showmatch = true

local group = vim.api.nvim_create_augroup("maudit", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  pattern = "*",
  command = "silent! lua vim.highlight.on_yank()",
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = group,
--   pattern = "*",
--   command = [[%s/\s\+$//e]],
-- })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = group,
--   pattern = "*",
--   command = [[%s/\n\+\%$//e]],
-- })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = group,
--   pattern = "*",
--   command = [[%s/^\s\+//e]],
-- })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
vim.api.nvim_create_autocmd("VimResized", {
  group = group,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
