return {
  {
    import = "lazyvim.plugins.extras.ui.mini-starter",
    -- 替换默认的启动屏幕
    opts = function()
      local logo = table.concat({
        "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
        "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
        "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
        "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
        "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
        "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
      }, "\n")
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")
        --stylua: ignore
        local config = {
          evaluate_single = true,
          header = logo,
          items = {
            new_section("Find file",    "Telescope find_files", "Telescope"),
            new_section("Recent files", "Telescope oldfiles",   "Telescope"),
            new_section("Grep text",    "Telescope live_grep",  "Telescope"),
            new_section("init.lua",     "e $MYVIMRC",           "Config"),
            new_section("Lazy",         "Lazy",                 "Config"),
            new_section("New file",     "ene | startinsert",    "Built-in"),
            new_section("Quit",         "qa",                   "Built-in"),
            new_section("Session restore", [[lua require("persistence").load()]], "Session"),
          },
          content_hooks = {
            starter.gen_hook.adding_bullet(pad .. "░ ", false),
            starter.gen_hook.aligning("center", "center"),
          },
        }
      return config
    end,
  },
  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.ui.mini-animate" },
  { import = "lazyvim.plugins.extras.ui.edgy" },
  { import = "lazyvim.plugins.extras.util.project" },
  { import = "lazyvim.plugins.extras.coding.yanky" },
  { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
  { import = "lazyvim.plugins.extras.util.project" },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
}
