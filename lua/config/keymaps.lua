-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("i", "<C-j>", "<Down>", { desc = "move down", silent = true, remap = true })
-- vim.keymap.set("i", "<C-k>", "<Up>", { desc = "move up", silent = true, remap = true })
-- vim.keymap.set("i", "<C-h>", "<Left>", { desc = "move left", silent = true, remap = true })
-- vim.keymap.set("i", "<C-l>", "<Right>", { desc = "move right", silent = true, remap = true })
-- vim.keymap.set("i", "<C-w>", "<esc>wi", { desc = "移动到下一个单词", silent = true, remap = true })
-- vim.keymap.set("i", "<C-b>", "<esc>bi", { desc = "移动到上一个单词", silent = true, remap = true })

-- 编辑器映射
vim.api.nvim_set_keymap("i", "<C-e>", "<esc>$a", { silent = true })
vim.api.nvim_set_keymap("i", "<C-a>", "<esc>_i", { silent = true })
vim.api.nvim_set_keymap("i", "<C-n>", "<Down>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-p>", "<Up>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { silent = true })

-- copilot映射规则
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-b>", "copilot#Accept('<CR>')", { expr = true, silent = true })

-- 使用neovide时
if vim.g.neovide then
  -- 让终端提供"+y "+p能力
  vim.api.nvim_set_keymap("n", "<D-v>", '"+p', { silent = true })
  vim.api.nvim_set_keymap("i", "<D-v>", '<C-c>"+pa', { silent = true })
end
-- telescope映射规则
-- vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope projects<CR>", { noremap = true, silent = true })
-- vim.cmd("let g:gruvbox_transparent_bg = 1")
-- vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
-- vim.cmd("colorscheme gruvbox")
