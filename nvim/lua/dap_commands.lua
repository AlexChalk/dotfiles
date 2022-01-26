local dap = require("dap")

M = {}

M.attach_python_debugger = function(port)
  local host = "127.0.0.1"
  local pythonAttachAdapter = { type = "server", host = host, port = port }
  local pythonAttachConfig = {
    type = "python",
    request = "attach",
    host = host,
    port = port,
    name = "Attach Debugger",
    cwd = vim.fn.getcwd(),
  }

  local session = dap.attach(pythonAttachAdapter, pythonAttachConfig)
  if session == nil then
    io.write("Error launching adapter")
  end
  require("dapui").open()
end

-- lua require'dap_commands'.attach_python_debugger(3000)
-- lua require'dap'.continue()
-- lua require'dapui'.open()
-- lua require'dapui'.close()
-- lua require'dap'.toggle_breakpoint()
-- lua require'dap'.step_over()
-- lua require'dap'.step_into()
-- lua require'dap'.step_out()
-- lua require'dap'.step_back()
-- lua require'dap'.up()
-- lua require'dap'.down()
-- lua require'dap'.set_exception_breakpoints({filters}, {exceptionOptions})

-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python
-- https://github.com/rcarriga/nvim-dap-ui

return M
