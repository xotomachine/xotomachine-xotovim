require'nvim-treesitter.configs'.setup {

  ensure_installed = { -- one of "all", or a list of languages
    "typescript",
    "dockerfile",
    "python",
    "scss",
    "vue",
    "graphql",
    "html",
    "markdown",
    "lua",
    "make",
    "jsdoc",
    "tsx",
    "sql",
    "javascript",
    "vim",
    "http",
    "llvm",
    "json",
    "bash",
    "yaml",
    "gitcommit",
  },

  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true,

  ignore_install = { "haskell" },  -- list of parsers to ignore installing

  highlight = {
    enable = true,
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection    = "<leader>gnn",
      node_incremental  = "<leader>gnr",
      scope_incremental = "<leader>gne",
      node_decremental  = "<leader>gnt",
    },
  },

  indent = {
    enable = true
  },

  rainbow = {
    enable = true,
    colors = {
      "#68a0b0",
      "#946EaD",
      "#c7aA6D",
      -- "Gold",
      -- "Orchid",
      -- "DodgerBlue",
      -- "Cornsilk",
      -- "Salmon",
      -- "LawnGreen",
    },
    disable = { "html" },
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  textobjects = {

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      
      goto_next_start = {
        ["]]"] = "@function.outer",
        ["]m"] = "@class.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
        ["]M"] = "@class.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
        ["[m"] = "@class.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
        ["[M"] = "@class.outer",
      },
    },
    
    select = {
      enable = true,
      lookahead = true, -- automatically jump forward to textobj, similar to targets.vim

      keymaps = { -- you can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer", 
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },

    swap = {
      enable = true,
      swap_next = {
        ["~"] = "@parameter.inner",
      },
    },
  },

  textsubjects = {
    enable = true,
    keymaps = {
      ['<cr>'] = 'textsubjects-smart', -- works in visual mode
    }
  },
}
