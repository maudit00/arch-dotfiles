vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>tu", "<cmd>colorscheme pywal<CR>", { desc = "Update colorscheme" })
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
-- Focus center while moving
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down center screen" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up center screen" })
-- Delete blank spaces before
keymap.set("n", "<leader>bp", function()
  vim.cmd("%s/^ *//g")
  vim.cmd("nohl")
end, { desc = "Cut blank space before start of the line" })
keymap.set("n", "<leader>ba", function()
  vim.cmd("%s/ *$//g")
  vim.cmd("nohl")
end, { desc = "Cut blank space at the end of the line" })
keymap.set("n", "<leader>bl", function()
  vim.cmd("g/^$/d")
  vim.cmd("nohl")
end, { desc = "Cut blank lines" })
keymap.set("v", "<leader>bn", function()
  vim.cmd([[s/\d/\0\&zwj;/g]])
  vim.cmd("nohl")
end, { desc = "Add escape char for numbers for emails" })
-- Focus center while next item
keymap.set("n", "n", "nzzzv", { desc = "Up center screen" })
keymap.set("n", "N", "Nzzzv", { desc = "Up center screen" })
-- Buffer
keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { desc = "Close Buffer" })
-- utiliti
keymap.set("n", "<leader>sa", "<cmd>wa<CR>", { desc = "Save all files" })
keymap.set("n", "<S-Q>", "<cmd>q!<CR>", { desc = "quit all files" })
keymap.set("n", "<leader>W", "<cmd>w !sudo tee % >/dev/null<CR>", { desc = "Save protected file" })
keymap.set("n", "<leader>src", "<cmd>so<CR>", { desc = "Re Source this file" })
-- window management
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
-- Open Lazy
keymap.set("n", "<leader>laz", "<cmd>Lazy <CR>", { desc = "Open Lazy" })
-- Open Lazy
keymap.set("n", "<leader>las", "<cmd>LiveServerStart <CR>", { desc = "Start Live Server" })
keymap.set("n", "<leader>lat", "<cmd>LiveServerStop <CR>", { desc = "Stop Live Server" })
--Line Wrapping Toggle
keymap.set("n", "<leader>swt", "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>", { desc = "Toggle line wrapping" })
-- Open Messages
keymap.set("n", "<leader>mm", "<cmd>mes<CR>", { desc = "Open Messages" })
-- Copy all
keymap.set("n", "<leader>ya", "<cmd>%y+<CR>", { desc = "Copy all text in the file" })
-- Oil
keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil" })
--Close Window
keymap.set("n", "<leader>wd", "<C-w>q", { desc = "Copy all text in the file" })
