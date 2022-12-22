local present, wk = pcall(require, "which-key")
if not present then
  return
end

wk.setup {

  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created

    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },

    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },

  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above

  operators = { gc = "Comments" },

  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },

  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },

  window = {
    border = XotoVimGlobal.ui.float.border, -- none, single, double, shadow, rounded
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
    -- padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },

  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
    align = "left", -- align columns left, center or right
  },

  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = {"<leader>"}, -- or specify a list manually

  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local normal_mode_mappings = {

  -- ignore
  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["5"] = "which_key_ignore",
  ["6"] = "which_key_ignore",
  ["7"] = "which_key_ignore",
  ["8"] = "which_key_ignore",
  ["9"] = "which_key_ignore",

  -- single
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "comment" },
  ["="] = { '<cmd>vertical resize + 5<CR>', 'resize + 5' },
  ["-"] = { '<cmd>vertical resize - 5<CR>', 'resize - 5' },
  ["v"] = { '<C-W>v', 'split right' },
  -- ["b"] = { '<C-W>s', 'split below' },
  -- ["q"] = { 'quicklist' },
  ['e'] = { '<cmd>NvimTreeToggle<CR>', 'explorer' },
  ['r'] = { '<cmd>Ranger<CR>', 'ranger' },
  -- ['E'] = { '<cmd>NvimTreeFocus<CR>', 'explorer focus' },
  ["w"] = { "<cmd>w!<CR>", "save" },
  ["x"] = { "<cmd>q!<CR>", "quit" },

  [";"] = {
    name = "xotovim",
    ["/"] = { '<cmd>Alpha<CR>', 'dashboard' },
    m = { '<cmd>e $MYVIMRC<CR>', 'main config' },
    c = { "<cmd>PackerCompile<cr>", "compile" },
    i = { "<cmd>PackerInstall<cr>", "install" },
    s = { "<cmd>PackerSync<cr>", "sync" },
    S = { "<cmd>PackerStatus<cr>", "status" },
    u = { "<cmd>PackerUpdate<cr>", "update" },
  },


  a = {
    name = "actions",
    -- c = { 'comment box' },
    l = { '<cmd>set nonumber!<CR>', 'line numbers' },
    r = { '<cmd>set norelativenumber!<CR>', 'relative number' },
    s = { '<cmd>LspToggleAutoFormat<CR>', 'format on save' },
  },

  t = {
    name = "terminal",
    t = { '<cmd>ToggleTerm direction=float<CR>', 'terminal float' },
  },

  b = {
    name = "buffer",
    x = { '<cmd>BufferCloseAllButCurrent<CR>', 'close but current' },
    -- d = { '<cmd>BufferOrderByDirectory<CR>', 'order by directory' },
    -- f = { '<cmd>bfirst<CR>', 'first buffer' },
    l = { '<cmd>BufferCloseBuffersLeft<CR>', 'close left' },
    r = { '<cmd>BufferCloseBuffersRight<CR>', 'close right' },
    p = { '<cmd>BufferMovePrevious<CR>', 'move prev' },
    n = { '<cmd>BufferMoveNext<CR>', 'move next' },
    s = { '<cmd>BufferPick<CR>', 'search buffer' },
  },

  -- l = {
  --   name = "lsp",
  -- },

  l = {
    name = "lsp",
    -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "code action" },
    a = { 'code action' },
    b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "buffer diagnostics" },
    w = { '<cmd>Telescope diagnostics wrap_results=true<CR>', 'workspace diagnostics' },
    -- D = { '<cmd>TroubleToggle<CR>', 'local diagnostics' },

    d = { "<cmd>Telescope diagnostics<cr>", "diagnostics" },
    -- f = { require("lvim.lsp.utils").format, "format" },
    i = { "<cmd>LspInfo<cr>", "info" },
    m = { "<cmd>Mason<cr>", "mason info" },
    n = { vim.diagnostic.goto_next, "next diagnostic", },
    p = { vim.diagnostic.goto_prev, "prev diagnostic", },
    l = { vim.lsp.codelens.run, "codelens action" },
    -- L = { 'line diagnostics' },
    f = { 'format' },
    q = { vim.diagnostic.setloclist, "quickfix" },
    t = { "<cmd>Telescope quickfix<cr>", "telescope quickfix" },
    -- r = { vim.lsp.buf.rename, "rename" },
    r = { 'rename' },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "document symbols" },
    -- S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "workspace symbols", },

  },

  -- d = {
    -- name = "debug",
    -- a = { 'attach' },
    -- b = { 'breakpoint' },
    -- c = { 'continue' },
    -- d = { 'continue' },
    -- h = { 'visual hover' },
    -- i = { 'step into' },
    -- o = { 'step over' },
    -- O = { 'step out' },
    -- t = { 'terminate' },
  -- },

  d = {
    name = "dab debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "toggle breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "step back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "run to cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "get session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "step into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "step over" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "step out" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "toggle repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "start" },
    q = { "<cmd>lua require'dap'.close()<cr>", "quit" },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", "toggle ui" },
  },

  -- P = {
  --   name = "packer",

  -- },

  g = {
    name = "git",
    a = { '<cmd>!git add %:p<CR>', 'add current' },
    A = { '<cmd>!git add .<CR>', 'add all' },
    b = { '<cmd>lua require("internal.blame").open()<CR>', 'blame' },
    B = { '<cmd>Telescope git_branches<CR>', 'branches' },
    c = {
      name = 'conflict',
      b = {'<cmd>GitConflictChooseBoth<CR>', 'choose both'},
      n = {'<cmd>GitConflictNextConflict<CR>', 'move to next conflict'},
      o = {'<cmd>GitConflictChooseOurs<CR>', 'choose ours'},
      p = {'<cmd>GitConflictPrevConflict<CR>', 'move to prev conflict'},
      t = {'<cmd>GitConflictChooseTheirs<CR>', 'choose theirs'},
    },
    d = { '<cmd>lua require("plugins.git.diffview").toggle_file_history()<CR>', 'diff file' },
    g = { '<cmd>LazyGit<CR>', 'lazygit' },
    h = {
      name = "hunk",
      d = "diff hunk",
      p = "preview",
      R = "reset buffer",
      r = "reset hunk",
      s = "stage hunk",
      S = "stage buffer",
      t = "toggle deleted",
      u = "undo stage",
    },
    l = {
      name = "log",
      A = {"<cmd>lua require('plugins.telescope').my_git_commits()<CR>", "commits (telescope)"},
      a = {"<cmd>LazyGitFilter<CR>", "commits"},
      C = {"<cmd>lua require('plugins.telescope').my_git_bcommits()<CR>", "buffer commits (telescope)"},
      c = {"<cmd>LazyGitFilterCurrentFile<CR>", "buffer commits"},
    },
    m = { "blame line" },
    s = { '<cmd>lua require("plugins.git.diffview").toggle_status()<CR>', 'status' },
    w = {
      name = "worktree",
      w = "worktrees",
      c = "create worktree",
    }
  },

  G = {
    name = "git v2",
    -- g = { '<cmd>lua require "lvim.core.terminal'.lazygit_toggle()<cr>', 'lazygit' },
    j = { '<cmd>lua require "gitsigns".next_hunk({navigation_message = false})<cr>', 'next hunk' },
    k = { '<cmd>lua require "gitsigns".prev_hunk({navigation_message = false})<cr>', 'prev hunk' },
    l = { '<cmd>lua require "gitsigns".blame_line()<cr>', 'blame' },
    p = { '<cmd>lua require "gitsigns".preview_hunk()<cr>', 'preview hunk' },
    r = { '<cmd>lua require "gitsigns".reset_hunk()<cr>', 'reset hunk' },
    R = { '<cmd>lua require "gitsigns".reset_buffer()<cr>', 'reset buffer' },
    s = { '<cmd>lua require "gitsigns".stage_hunk()<cr>', 'stage hunk' },
    u = { '<cmd>lua require "gitsigns".undo_stage_hunk()<cr>', 'undo stage hunk', },
    o = { '<cmd>Telescope git_status<cr>', 'open changed file' },
    b = { '<cmd>Telescope git_branches<cr>', 'checkout branch' },
    c = { '<cmd>Telescope git_commits<cr>', 'checkout commit' },
    C = { '<cmd>Telescope git_bcommits<cr>', 'checkout commit(for current file)', },
    d = { '<cmd>Gitsigns diffthis HEAD<cr>', 'git diff', },
  },

  p = {
    name = "project",
    f = { 'file' },
    w = { 'word' },
    l = { "<cmd>lua require'telescope'.extensions.repo.cached_list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%timeshift/', '/usr/', '/srv/', '/%.oh%-my%-zsh', '/Library/', '/%.cocoapods/'}}<CR>", 'list' },
    r = { 'refactor' },
    s = { "<cmd>SessionManager save_current_session<CR>", 'save session' },
    t = { "<cmd>TodoTrouble<CR>", 'todo' },
  },

  f = {
    name = "find",
    -- d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>', 'dotfiles' },
    s = { '<cmd>Telescope search_history theme=dropdown<CR>', 'search history' },
    -- b = { '<cmd>Telescope git_branches<cr>', 'checkout branch' },
    c = { '<cmd>lua require("telescope.builtin").colorscheme({enable_preview = true})<cr>', 'colorscheme with preview'},
    C = { '<cmd>Telescope commands<cr>', 'commands' },
    -- f = { '<cmd>Telescope find_files<cr>', 'find file' },
    -- h = { '<cmd>Telescope help_tags<cr>', 'find help' },
    f = { '<cmd>Telescope oldfiles hidden=true<CR>', 'file history' },
    H = { '<cmd>Telescope highlights<cr>', 'highlighted groups' },
    g = { '<cmd>lua require("plugins.telescope").command_history()<CR>', 'command history' },

    -- M = { '<cmd>Telescope man_pages<cr>', 'man pages' },
    r = { '<cmd>Telescope oldfiles<cr>', 'recent file' },
    -- R = { '<cmd>Telescope registers<cr>', 'registers' },
    t = { '<cmd>Telescope live_grep<cr>', 'text' },
    k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
  },


  ["s"] = {
    name = "session",
    c = { '<cmd>SessionManager load_session<CR>', 'choose session' },
    r = { '<cmd>SessionManager delete_session<CR>', 'remove session' },
    d = { '<cmd>SessionManager load_current_dir_session<CR>', 'current dir session' },
    l = { '<cmd>SessionManager load_last_session<CR>', 'last session' },
    s = { '<cmd>SessionManager save_current_session<CR>', 'save session' },
  },


  -- t = {
  --   name = "table mode",
  --   m = { 'toggle' },
  --   t = { 'tableize' },
  -- },
}

local visual_mode_mappings = {
  -- single
  ["s"] = { "<cmd>'<,'>sort<CR>", 'sort' },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "comment" },
  -- a = {
  --   name = "actions",
  --   c = { 'comment box' },
  -- },

  l = {
    name = "lsp",
    a = { 'range code action' },
    f = { 'range format' },
  },

  g = {
    name = "git",
    h = {
      name = "hunk",
      r = "reset hunk",
      s = "stage hunk",
    },
  },

  p = {
    name = "project",
    r = { 'refactor' },
  },

--[[   t = {
    name = "table mode",
    t = { 'tableize' },
  }, ]]
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Register                                                 │
-- ╰──────────────────────────────────────────────────────────╯

wk.register(normal_mode_mappings, opts)
wk.register(visual_mode_mappings, visual_opts)

local function attach_markdown(bufnr)
  wk.register({
    a = {
      name = "actions",
      m = { '<cmd>MarkdownPreviewToggle<CR>', 'markdown preview' },
    }
  }, {
    buffer = bufnr ,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_typescript(bufnr)
  wk.register({
    l = {
      name = "lsp",
      f = { '<cmd>TypescriptFixAll<CR>', 'fix all' },
      i = { '<cmd>TypescriptAddMissingImports<CR>', 'import all'},
      o = { '<cmd>TypescriptOrganizeImports<CR>', 'organize imports'},
      r = { '<cmd>TypescriptRemoveUnused<CR>', 'remove unused' },
    }
  }, {
    buffer = bufnr ,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_npm(bufnr)
  wk.register({
    n = {
      name = "npm",
      c = { '<cmd>lua require("package-info").change_version()<CR>', 'change version' },
      d = { '<cmd>lua require("package-info").delete()<CR>', 'delete package' },
      h = { "<cmd>lua require('package-info').hide()<CR>", 'hide'},
      i = { '<cmd>lua require("package-info").install()<CR>', 'install new package' },
      r = { '<cmd>lua require("package-info").reinstall()<CR>', 'reinstall dependencies' },
      s = { '<cmd>lua require("package-info").show()<CR>', 'show' },
      u = { '<cmd>lua require("package-info").update()<CR>', 'update package'},
    }
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_zen(bufnr)
  wk.register({
    ["z"] = { '<cmd>ZenMode<CR>', 'zen' },
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_jest(bufnr)
  wk.register({
    j = {
      name = "jest",
      f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', 'run current file' },
      i = { '<cmd>lua require("neotest").summary.toggle()<CR>', 'toggle info panel' },
      j = { '<cmd>lua require("neotest").run.run()<CR>', 'run nearest test' },
      l = { '<cmd>lua require("neotest").run.run_last()<CR>', 'run last test' },
      o = { '<cmd>lua require("neotest").output.open({ enter = true })<CR>', 'open test output'},
      s = { '<cmd>lua require("neotest").run.stop()<CR>', 'stop' },
    }
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_spectre(bufnr)
  wk.register({
    ["r"] = { '[SPECTRE] replace all'},
    ["o"] = { '[SPECTRE] show options'},
    ["q"] = { '[SPECTRE] send all to quicklist'},
    ["v"] = { '[SPECTRE] change view mode'},
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

return {
  attach_markdown = attach_markdown,
  attach_typescript = attach_typescript,
  attach_npm = attach_npm,
  attach_zen = attach_zen,
  attach_jest = attach_jest,
  attach_spectre = attach_spectre,
}
