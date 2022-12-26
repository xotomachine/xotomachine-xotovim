local present, session_manager = pcall(require, "session_manager")
if not present then
  return
end

local path_present, Path = pcall(require, "plenary.path")
if not path_present then
  return
end

session_manager.setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- the directory where the session files will be saved.
  path_replacer = '__', -- the character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- the character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- define what to do when neovim is started without arguments. possible values: disabled, currentdir, lastsession
  autosave_last_session = true, -- automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_filetypes = {'gitcommit'},  -- all buffers of these file types will be closed before the session is saved.
  autosave_only_in_session = true, -- always autosaves session. if true, only autosaves after a session is active.
  max_path_length = 80,  -- shorten the display path if length exceeds this threshold. use 0 if don't want to shorten the path at all.
})
