return {
  { "terrortylor/nvim-comment", version = false },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      -- 注释
      -- n gcc:  single line
      --   gcip: paragraph
      --   gcw:  current word line
      --   gc4j: next 4 lines
      --   dic:  delete line comment
      --   gcic: delete paragraph comment
      -- v gc  block lines
      require("nvim_comment").setup()
    end,
    keys = function(_, keys)
      return {
        { "<Leader>cD", ":lua require('neogen').generate()<CR>", desc = "Doc Comment" },
      }
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
}
