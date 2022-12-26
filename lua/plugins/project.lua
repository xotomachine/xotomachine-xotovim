require("project_nvim").setup({
  
  manual_mode = false, -- manual mode doesn't automatically change your root directory, so you have -- the option to manually do so using `:projectroot` command.
  detection_methods = { "lsp", "pattern" }, -- methods of detecting the root directory. **"lsp"** uses the native neovim -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. here -- order matters: if one is not detected, the other is used as fallback. you -- can also delete or rearangne the detection methods.
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" }, -- all the patterns used to detect root dir, when **"pattern"** is in -- detection_methods
  ignore_lsp = {}, -- table of lsp clients to ignore by name -- eg: { "efm", ... }
  exclude_dirs = {}, -- don't calculate root dir on specific directories -- ex: { "~/.cargo/*", ... }
  show_hidden = false, -- show hidden files in telescope
  silent_chdir = true, -- when set to false, you will get a message when project.nvim changes your -- directory.
  scope_chdir = 'global', -- what scope to change the directory, valid options are -- * global (default) -- * tab -- * win
  datapath = vim.fn.stdpath("data"), -- path where project.nvim will store the project history for use in -- telescope
  
  -- manual_mode = false,  -- Manual mode doesn't automatically change your root directory, so you have -- the option to manually do so using `:ProjectRoot` command.
  -- detection_methods = {"lsp", "pattern"},  -- Methods of detecting the root directory. **"lsp"** uses the native neovim -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here -- order matters: if one is not detected, the other is used as fallback. You -- can also delete or rearangne the detection methods.
  -- patterns = {".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json"},  -- All the patterns used to detect root dir, when **"pattern"** is in -- detection_methods
  -- ignore_lsp = {},  -- Table of lsp clients to ignore by name -- eg: { "efm", ... }
  -- exclude_dirs = {},  -- Don't calculate root dir on specific directories -- Ex: { "~/.cargo/*", ... }
  -- show_hidden = false,  -- Show hidden files in telescope
  -- silent_chdir = true,  -- When set to false, you will get a message when project.nvim changes your -- directory.
  -- scope_chdir = 'global',  -- What scope to change the directory, valid options are -- * global (default) -- * tab -- * win
  -- datapath = vim.fn.stdpath("data"),  -- Path where project.nvim will store the project history for use in -- telescope

  -- respect_buf_cwd = true,
  -- update_focused_file = {
      -- enable = true,
      -- update_root = true
  -- }
})
