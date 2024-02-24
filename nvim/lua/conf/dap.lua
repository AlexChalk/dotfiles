local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    pythonPath = require("commands.python").get_python_bin_path,
  },
}

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  element_mappings = {}, --[[ Per-element overrides of global mappings ]]
  expand_lines = true,
  force_buffers = true,
  controls = {
    enabled = true,
    element = "repl",
    icons = {
      pause = "⏸",
      play = "⯈",
      step_into = "↴",
      step_over = "↷",
      step_out = "↑",
      step_back = "↶",
      run_last = "🗘",
      terminate = "🕱",
      disconnect = "⏻",
    },
  },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  layouts = {
    {
      -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        {
          id = "scopes",
          size = 0.25, -- Can be float or integer > 1
        },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 00.25 },
      },
      size = 40,
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    {
      elements = { "repl", "console" },
      size = 10,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  render = {
    indent = 1,
    max_value_lines = 100,
  },
  windows = { indent = 1 },
})
