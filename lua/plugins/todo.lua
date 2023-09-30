return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    opts = { highlight = { pattern = [[.*<(KEYWORDS)\s*]] } },
  },
}
