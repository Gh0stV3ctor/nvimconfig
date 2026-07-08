-- DAP (Debug Adapter Protocol) chain — mirror of keymaps/langs/dap.lua
-- Consumes dap_adapters and dap_configurations from core.language aggregator.
-- DAP is the only chain where the client (nvim-dap) is NOT built into Neovim.
return {
  -- === Core: nvim-dap (DAP protocol client) ===
  -- Registers all language adapters and launch configurations from the aggregator.
  -- Lazy-loaded on first DAP keypress — no adapter processes are spawned until then.
  {
    'mfussenegger/nvim-dap',
    keys = require('keymaps.langs.dap'),
    config = function()
      local dap = require('dap')
      local language = require('core.language')

      -- Register adapters from aggregated lang file dap.adapter fields.
      -- Each adapter defines how to start the debugger binary:
      --   debugpy (Python): launch as executable, communicate via stdin/stdout
      --   codelldb (C/C++/Rust): launch as server, communicate via TCP port
      --   delve (Go): launch as server, communicate via TCP port
      for name, adapter_config in pairs(language.dap_adapters) do
        dap.adapters[name] = adapter_config
      end

      -- Register per-filetype launch/attach configurations.
      -- Each configuration defines one way to start a debug session:
      --   launch: start the program from scratch
      --   attach: connect to an already-running process
      -- Multiple configs per filetype are accumulated (e.g. Go: Launch file, Launch test, Attach).
      for filetype, configs in pairs(language.dap_configurations) do
        dap.configurations[filetype] = dap.configurations[filetype] or {}
        for _, cfg in ipairs(configs) do
          table.insert(dap.configurations[filetype], cfg)
        end
      end
    end,
  },

  -- === UI: nvim-dap-ui (debug panel) ===
  -- Provides side panels for scopes (variables), stacks (call stack),
  -- breakpoints, and watch expressions. Opens automatically on debug start
  -- and closes when the session ends.
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    keys = require('keymaps.langs.dap'),
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup()

      -- Open the debug panel when the debug session initializes (program launched)
      dap.listeners.after.event_initialized['dapui'] = function()
        dapui.open()
      end

      -- Close the panel when the user terminates the session
      dap.listeners.before.event_terminated['dapui'] = function()
        dapui.close()
      end

      -- Close the panel when the debuggee process exits
      dap.listeners.before.event_exited['dapui'] = function()
        dapui.close()
      end
    end,
  },

  -- === Inline values: nvim-dap-virtual-text ===
  -- Displays variable values at end-of-line when the program is paused.
  -- No panel needed — values appear directly in the buffer as virtual text.
  -- commented = true: renders as " -- x = 42" (comment style), not actual code.
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = { 'mfussenegger/nvim-dap' },
    keys = require('keymaps.langs.dap'),
    opts = {
      commented = true,
    },
  },
}
