local present_dapui, dapui = pcall(require, "dapui")
local present_dap, dap = pcall(require, "dap")
local present_virtual_text, dap_vt = pcall(require, "nvim-dap-virtual-text")
local _, shade = pcall(require, "shade")

if not present_dapui or not present_dap or not present_virtual_text then
  return
end

-- ╭──────────────────────────────────────────────────────────╮
-- │ dap virtual text setup                                   │
-- ╰──────────────────────────────────────────────────────────╯
dap_vt.setup({
  enabled = true, -- enable this plugin (the default)
  enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- highlight changed values with nvimdapvirtualtextchanged, else always nvimdapvirtualtext
  highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true, -- show stop reason when stopped for exceptions
  commented = false, -- prefix virtual text with comment string
  only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
  all_references = false, -- show virtual text on all all references of the variable (not only definitions)
  filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (lua gmatch pattern, default filters out python modules)

  -- experimental features :
  virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false, -- show virtual text for all stack frames not only current. only works for debugpy on my machine.
  virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ dap ui setup                                             │
-- ╰──────────────────────────────────────────────────────────╯
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" }, -- use a table to apply multiple mappings
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  
  expand_lines = vim.fn.has("nvim-0.7"), -- expand lines larger than the window -- requires >= 0.7
  
  layouts = { -- layouts define sections of the screen to place windows. -- the position can be "left", "right", "top" or "bottom". -- the size specifies the height/width depending on position. it can be an int -- or a float. integer specifies height/width directly (i.e. 20 lines/columns) while -- float value specifies percentage (i.e. 0.3 - 30% of available lines/columns) -- elements are the elements shown in the layout (in order). -- layouts are opened in order so that earlier layouts take priority in window sizing.
    {
      elements = {
        -- elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- these can be integers or a float between 0 and 1.
    max_width = nil, -- floats will be treated as percentage of your screen.
    border = XotoVimGlobal.ui.float.border, -- border style. can be "single", "double"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- can be integer or nil.
  }
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ dap setup                                                │
-- ╰──────────────────────────────────────────────────────────╯
dap.set_log_level('TRACE');

-- automatically open ui
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open();
  shade.toggle();
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close();
  shade.toggle();
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close();
  shade.toggle();
end

-- enable virtual text
vim.g.dap_virtual_text = true

-- ╭──────────────────────────────────────────────────────────╮
-- │ icons                                                    │
-- ╰──────────────────────────────────────────────────────────╯
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })

-- ╭──────────────────────────────────────────────────────────╮
-- │ keybindings                                              │
-- ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_set_keymap("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dc", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", { noremap = true, silent = true })

-- ╭──────────────────────────────────────────────────────────╮
-- │ adapters                                                 │
-- ╰──────────────────────────────────────────────────────────╯
-- node / typescript
dap.adapters.node2 = {
  type = 'executable';
  command = 'node',
  args = { vim.fn.stdpath "data" .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' };
}

-- chrome
dap.adapters.chrome = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath "data" .. '/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js' };
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ configurations                                           │
-- ╰──────────────────────────────────────────────────────────╯
dap.configurations.javascript = {
  {
    type = 'node2';
    request = 'launch';
    program = '${file}';
    cwd = vim.fn.getcwd();
    sourceMaps = true;
    protocol = 'inspector';
    console = 'integratedTerminal';
  }
}

dap.configurations.javascript = {
  {
    type = 'chrome',
    request = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    webRoot = '${workspaceFolder}'
  }
}

dap.configurations.javascriptreact = {
  {
    type = 'chrome',
    request = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    webRoot = '${workspaceFolder}'
  }
}

dap.configurations.typescriptreact = {
  {
    type = 'chrome',
    request = 'attach',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    port = 9222,
    webRoot = '${workspaceFolder}'
  }
}
