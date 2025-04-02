local dap = require 'dap'

dap.adapters.coreclr = {
  type = 'executable',
  command = '/Users/marcus/.vsdbg/vsdbg',
  args = { '--interpreter=vscode' },
}

dap.configurations.cs = {
  {
    type = 'coreclr',
    name = 'Launch .NET App',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to DLL: ', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
    end,
  },
  {
    type = 'coreclr',
    request = 'attach',
    name = 'Attach to .NET Process',
    processId = function()
      local handle = io.popen 'pgrep -f Integration.Definitiv.Functions'
      local result = handle:read '*a'
      handle:close()

      local pid = tonumber(result:match '%d+')
      if pid then
        print('✅ Attaching to process: ' .. pid)
        return pid
      else
        error '❌ No valid process found! Make sure the function is running.'
      end
    end,
    cwd = vim.fn.getcwd(),
    stopAtEntry = false,
  },
}

-- Debug UI
local dapui_ok, dapui = pcall(require, 'dapui')
if dapui_ok then
  dapui.setup()
end

vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>")
