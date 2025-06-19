return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")

    -- .NET / C# adapter config
    local install_path = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg"
    dap.adapters.coreclr = {
      type = "executable",
      command = install_path,
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
      },
      {
        type = "coreclr",
        name = "attach - netcoredbg",
        request = "attach",
        processId = function()
          return require("dap.utils").pick_process()
        end,
      },
    }

    -- C++ / ASCII Game config
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    }

    dap.configurations.cpp = {
      {
        name = "Launch ASCII Game",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", "./Game", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "Enable pretty printing",
            ignoreFailures = false,
          },
        },
      },
    }

    -- Optional: apply same config for C files
    dap.configurations.c = dap.configurations.cpp
  end,
}
