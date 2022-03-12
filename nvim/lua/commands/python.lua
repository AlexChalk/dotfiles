local M = {}

-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
M.get_python_bin_path = function(executable)
  if executable == nil then
    executable = "python"
  end

  local cwd = vim.fn.getcwd()

  if vim.fn.executable(cwd .. "/result/bin/python") == 1 then
    return cwd .. "/result/bin/" .. executable
  elseif vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
    return cwd .. "/venv/bin/" .. executable
  elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    return cwd .. "/.venv/bin/" .. executable
  else
    return "" .. executable
  end
end

return M
