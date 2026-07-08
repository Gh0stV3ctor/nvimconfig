-- DAP keymaps — mirror of plugins/langs/dap.lua
-- All functions are wrapped in function() to defer require('dap') until first use:
-- lazy.nvim intercepts the key, loads nvim-dap, then the function executes.
return {
  -- Start debugging or continue to next breakpoint
  { '<leader>dc', function() require('dap').continue() end, desc = 'Debug: Continue' },

  -- Step over: execute current line, don't enter function calls
  { '<leader>do', function() require('dap').step_over() end, desc = 'Debug: Step Over' },

  -- Step into: enter the function call at the cursor
  { '<leader>di', function() require('dap').step_into() end, desc = 'Debug: Step Into' },

  -- Step out: finish current function and return to caller
  { '<leader>dO', function() require('dap').step_out() end, desc = 'Debug: Step Out' },

  -- Toggle breakpoint on the current line
  { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },

  -- Conditional breakpoint: prompt for a condition expression (e.g. "i == 4999"),
  -- then set a breakpoint that only triggers when that condition evaluates to true
  { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Debug: Conditional Breakpoint' },

  -- Re-run the last debug session with the same configuration
  { '<leader>dr', function() require('dap').run_last() end, desc = 'Debug: Run Last' },

  -- Terminate the active debug session and kill the debuggee process
  { '<leader>dt', function() require('dap').terminate() end, desc = 'Debug: Terminate' },

  -- Toggle the interactive REPL for evaluating expressions while paused
  { '<leader>dR', function() require('dap').repl.toggle() end, desc = 'Debug: Toggle REPL' },

  -- Run until the line under the cursor, then pause (temporary breakpoint)
  { '<leader>dl', function() require('dap').run_to_cursor() end, desc = 'Debug: Run to Cursor' },
}
