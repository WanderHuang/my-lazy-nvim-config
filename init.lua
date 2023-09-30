if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "torpedo"
  -- vim.g.neovide_cursor_vfx_mode = "ripple"
end
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
