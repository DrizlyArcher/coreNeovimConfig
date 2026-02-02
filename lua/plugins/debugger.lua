return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- args = { "/Users/charles.inshaw/js-debug/src/dapDebugServer.js", "${port}" },
        args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
      }
    }

    for _, value in ipairs({ "javascript", "typescript" }) do
      dap.configurations[value] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          name = "Attach to node process",
          type = "pwa-node",
          request = "attach",
          rootPath = "${workspaceFolder}",
          processId = require("dap.utils").pick_process
        }
      }
    end

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
    vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>db', function() dap.set_breakpoint() end)
    -- vim.keymap.set('n', '<F10>', function() dap.step_over() end)
    -- vim.keymap.set('n', '<F11>', function() dap.step_into() end)
    -- vim.keymap.set('n', '<F12>', function() dap.step_out() end)
  end
}
