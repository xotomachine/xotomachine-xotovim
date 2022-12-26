local utils = require('utils')

local async_present, async = pcall(require, "plenary.async")
if not async_present then
  return
end

-- Exported functions
local M = {}

M.first_xotovim_run = function()
  local is_first_run = utils.file_exists('/tmp/first-xotovim-run')

  if is_first_run then
    async.run(function()
      require('notify')("welcome to xotovim! hope you'll have a nice experience!", "info", { title = "xotovim", timeout = 5000 })
    end)
    local suc = os.remove('/tmp/first-xotovim-run')
    if (not suc) then print("error: couldn't remove /tmp/first-xotovim-run!") end
  end
end

M.first_xotovim_run()

local present, win = pcall(require, "lspconfig.ui.windows")
if not present then
  return
end

local _default_opts = win.default_opts
win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = XotoVimGlobal.ui.float.border
  return opts
end

return M
