return {
  {
    "microsoft/vscode-js-debug",
    -- lazy = false,
    -- optional = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    -- lang = js
    "mxsdev/nvim-dap-vscode-js",
    dependencies = {
      { "mfussenegger/nvim-dap" },
    },
    config = function()
      -- 调试器
      -- <leader>d
      require("dap-vscode-js").setup({
        -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        debugger_path = "/Users/mac/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
        -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        log_console_level = vim.log.levels.TRACE, -- Logging level for output to console. Set to false to disable console output.
      })
      for _, language in ipairs({ "typescript", "javascript" }) do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end

      -- see: https://github.com/theHamsta/nvim-dap-virtual-text/issues/61
      require("nvim-dap-virtual-text").setup({
        -- virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
        -- virt_text_pos = "inline",
        virt_text_pos = "eol",
      })

      -- json5配置
      -- https://github.com/neovim/neovim/issues/21749#issuecomment-1378720864
      -- Fix loading of json5
      table.insert(vim._so_trails, "/?.dylib")

      -- lauch文件配置
      -- local js_based_languages = { "typescript", "javascript", "typescriptreact" }
      -- require("dap.ext.vscode").load_launchjs(nil, {
      --   ["pwa-node"] = js_based_languages,
      --   ["node"] = js_based_languages,
      --   ["chrome"] = js_based_languages,
      --   ["pwa-chrome"] = js_based_languages,
      -- })

      -- https://github.com/brenoprata10/nvim-highlight-colors
      -- require("nvim-highlight-colors").setup
      --
    end,
  },
}
