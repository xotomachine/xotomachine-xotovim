-- TODO : remove


-- require('dressing').setup({
--   input = {
--     enabled = true, -- Set to false to disable the vim.ui.input implementation
--     default_prompt = "Input:", -- Default prompt string
--     prompt_align = "center", -- Can be 'left', 'right', or 'center'
--     insert_only = true, -- When true, <Esc> will close the modal
--     start_in_insert = true, -- When true, input will start in insert mode.
--     anchor = "SW", -- These are passed to nvim_open_win
--     border = XotoVimGlobal.ui.float.border,
--     relative = "editor", -- 'editor' and 'win' will default to being centered -- can be "editor"
--     prefer_width = 5, -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
--     width = nil,
--     max_width = { 140, 0.9 }, -- min_width and max_width can be a list of mixed types. -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
--     -- min_width = { 10, 0.1 },
    
--     win_options  = { -- Change default highlight groups (see :help winhl)
--       winblend = 0,
--       winhighlight = ''
--     },
    
--     mappings = { -- Set to `false` to disable
--       n = {
--         ["<Esc>"] = "Close",
--         ["<CR>"] = "Confirm",
--       },
      
--       i = {
--         ["<C-c>"] = "Close",
--         ["<CR>"] = "Confirm",
--         ["<Up>"] = "HistoryPrev",
--         ["<Down>"] = "HistoryNext",
--       },
--     },
    
--     override = function(conf)
--       return conf -- This is the config that will be passed to nvim_open_win. -- Change values here to customize the layout
--     end,
    
--     get_config = nil, -- see :help dressing_get_config
--   },
  
--   select = {
--     enabled = true, -- Set to false to disable the vim.ui.select implementation
--     backend = { "telescope", "nui", "fzf", "builtin" }, -- Priority list of preferred vim.select implementations
--     trim_prompt = true, -- Trim trailing `:` from prompt
    
--     nui = { -- Options for nui Menu
--       position = {row = 1, col = 0},
--       size = nil,
--       relative = "editor",
--       border = {style = XotoVimGlobal.ui.float.border, text = {top_align = "right"}},
--       buf_options = {swapfile = false, filetype = "DressingSelect"},
--       max_width = 80,
--       max_height = 40,
--     },
    
--     -- Options for fzf selector
--     fzf = {
--       window = {
--         width = 0.5,
--         height = 0.4,
--       },
--     },
    
--     builtin = { -- Options for built-in selector
--       wnchor = "NW", -- These are passed to nvim_open_win
--       border = XotoVimGlobal.ui.float.border,
--       relative = "editor", -- 'editor' and 'win' will default to being centered -- can be "cursor"
      
--       win_options  = { -- Change default highlight groups (see :help winhl)
--         winblend = 0,
--         winhighlight = ''
--       },
      
--       width = nil, -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%) -- the min_ and max_ options can be a list of mixed types. -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
--       max_width = { 140, 0.8 },
--       min_width = { 10, 0.2 },
--       height = nil,
--       max_height = 0.9,
--       min_height = { 2, 0.05 },
      
--       mappings = { -- Set to `false` to disable
--         ["<Esc>"] = "Close",
--         ["<C-c>"] = "Close",
--         ["<CR>"] = "Confirm",
--       },
      
--       override = function(conf)
--         return conf -- This is the config that will be passed to nvim_open_win. -- Change values here to customize the layout
--       end,
--     },
    
--     -- get_config = function(opts) -- see :help dressing_get_config
--     --   if opts.kind == 'codeaction' then
--     --     return {
--     --       -- enabled = flase,
--     --       backend = 'builtin',
--     --       nui = {
--     --         relative = 'cursor', -- can be "cursor"
--     --         max_width = 80,
--     --         min_height = 1
--     --       }
--     --     }
--     --   end
--     -- end
--   },
-- })
