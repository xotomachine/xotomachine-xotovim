local utils = require('utils')
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local TREE_WIDTH = 30

local git_icons = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "➜",
    untracked = "",
    deleted = "",
    ignored = " "
}

local folders = {
  symlink = "",
  text = "",
  folder = "",
  emptyfolder = "",
  emptyfolderOpen = "",
  folderopen = "",
  foldersymlink = "",
}

local keymappings = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  { key = {"O"}, action = "edit_no_picker" },
  { key = {"<2-RightMouse>", "<C-]>"}, action = "cd" },
  { key = "<C-v>", action = "vsplit" },
  { key = "<C-x>", action = "split" },
  { key = "<C-t>", action = "tabnew" },
  { key = "<", action = "prev_sibling" },
  { key = ">", action = "next_sibling" },
  { key = "P", action = "parent_node" },
  { key = "<BS>", action = "close_node" },
  { key = "<Tab>", action = "preview" },
  { key = "K", action = "first_sibling" },
  { key = "J", action = "last_sibling" },
  { key = "I", action = "toggle_ignored" },
  { key = "H", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "D", action = "trash" },
  { key = "r", action = "rename" },
  { key = "<C-r>", action = "full_rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "[c", action = "prev_git_item" },
  { key = "]c", action = "next_git_item" },
  { key = "-", action = "dir_up" },
  { key = "s", action = "system_open" },
  { key = "q", action = "close" },
  { key = "g?", action = "toggle_help" },
  { key = "W", action = "collapse_all" },
  { key = "S", action = "search_node" }
}

require'nvim-tree'.setup {
  disable_netrw = false,  -- disables netrw completely
  hijack_netrw = true,  -- hijack netrw window on startup
  open_on_setup = false,  -- open the tree when running this setup function
  ignore_ft_on_setup = { "startify", "dashboard" },  -- will not open on setup if the filetype is in this list
  open_on_tab = false,  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  auto_reload_on_write = true,
  hijack_cursor = true,  -- hijack the cursor in the tree to put it at the start of the filename
  update_cwd = true,  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  hijack_unnamed_buffer_when_opening = false,  -- opens in place of the unnamed buffer if it's empty
  respect_buf_cwd = true,  -- false by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree

  diagnostics = { -- show lsp diagnostics in the signcolumn
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },

  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",

    indent_markers = {
      inline_arrows = true,
      enable = false,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },

    icons = {
      webdev_colors = true,

      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },

      glyphs = {
        default = folders.text,
        symlink = folders.symlink,
        git = git_icons,
        folder = {
          default = folders.folder,
          empty = folders.emptyfolder,
          empty_open = folders.emptyfolderopen,
          open = folders.folderopen,
          symlink = folders.foldersymlink,
        },
      },

    }
  },

  update_focused_file = { -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    enable = true,   -- enables the feature
    update_cwd = true,   -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory. only relevant when `update_focused_file.enable` is true
    ignore_list = {}   -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
  },

  system_open = {  -- configuration options for the system open command (`s` in the tree by default)
    cmd = "",  -- the command to run this, leaving nil should work in most cases
    args = {}  -- the command arguments as a list
  },

  filters = {
    dotfiles = false,
    custom = { "node_modules", "\\.cache" },
    exclude = {},
  },

  git = {
    enable = true,
    ignore = false,
    timeout = 200,
  },

  actions = {
    use_system_clipboard = true,

    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },

    open_file = {
      quit_on_open = false, 
      resize_window = true, -- if true the tree will resize itself after opening a file

      window_picker = {
        enable = false,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },

  view = {
    adaptive_size = false,
    signcolumn = "yes",
    number = false,
    width = TREE_WIDTH, -- width of the window, can be either a number (columns) or a string in `%`
    hide_root_folder = false,
    side = 'left',  -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'

    mappings = {
      custom_only = true, -- custom only false will merge the list with the default mappings. if true, it will only use your list to set the mappings
      list = keymappings -- list of mappings to set on the tree manually
    },

    relativenumber = false,
    
    
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = XotoVimGlobal.ui.float.border,
        width = math.floor(vim.fn.winwidth(0)),
      },
    },

  },

  trash = {
    cmd = "trash",
    require_confirm = true
  },

  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  }
}

vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>lua require'nvim-tree'.toggle()<CR>", { noremap = true, silent = true })

nvim_tree_events.on_tree_open(function ()
    -- bufferline_api.set_offset(utils.add_whitespaces(0) .. 'file explorer')
    -- bufferline_api.set_offset(TREE_WIDTH + 1, utils.add_whitespaces(0) .. 'file explorer')
    bufferline_api.set_offset(TREE_WIDTH + 3, utils.add_whitespaces(1) .. ' PROJECT')
end)

nvim_tree_events.on_tree_close(function ()
    bufferline_api.set_offset(0)
end)
