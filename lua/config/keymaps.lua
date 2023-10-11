-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 编辑器映射
vim.keymap.set("i", "<C-a>", "<esc>_i", { desc = "cursor to head", silent = true })
vim.keymap.set("i", "<C-e>", "<esc>$a", { desc = "cursor to end", silent = true })

-- copilot映射规则
vim.g.copilot_no_tab_map = true
vim.keymap.set(
  "i",
  "<C-l>",
  "copilot#Accept('<CR>')",
  { desc = "use copilot suggestion", expr = true, silent = true, noremap = true }
)

-- 使用neovide时
if vim.g.neovide then
  -- 让终端提供"+y "+p能力
  vim.keymap.set("n", "<D-v>", '"+p', { silent = true })
  vim.keymap.set("i", "<D-v>", '<C-c>"+pa', { silent = true })
  vim.g.neovide_input_macos_alt_is_meta = true
end
-- telescope映射规则
-- vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope projects<CR>", { noremap = true, silent = true })
-- vim.cmd("let g:gruvbox_transparent_bg = 1")
-- vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
-- vim.cmd("colorscheme gruvbox")
