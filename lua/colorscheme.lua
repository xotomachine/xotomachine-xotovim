local present, tokyonight = pcall(require, "tokyonight")
if not present then
  return
end

local tokioColor = require("tokyonight.colors").setup({})
local tokioBorder = "#242738";
-- local tokioDark = "#16161F";

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup Colorscheme                                        │
-- ╰──────────────────────────────────────────────────────────╯
tokyonight.setup({

  style = "night",

  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  light_style = "day", -- The theme is used when the background is set to light

  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },

  -- styles = {
  --   -- Style to be applied to different syntax groups
  --   -- Value is any valid attr-list value `:help attr-list`
  --   comments = "italic",
  --   keywords = "italic",
  --   functions = "NONE",
  --   variables = "NONE",
  --   -- Background styles. Can be "dark", "transparent" or "normal"
  --   sidebars = "dark", -- style for sidebars, see below
  --   floats = "dark", -- style for floating windows
  -- },

  use_background = true, -- can be light/dark/auto. When auto, background will be set to vim.o.background
  -- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  sidebars = {
    "qf",
    "vista_kind",
    "terminal",
    "packer",
    "spectre_panel",
    "NeogitStatus",
    "help"
  }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`

  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_colors = function(tokioGroupColor)
    tokioGroupColor.hint = tokioGroupColor.orange
    -- tokioGroupColor.error = "#ff0000"
    tokioGroupColor.border = tokioBorder
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- fucntion will be called with a Highlights and ColorScheme table
  -- on_highlights = function(highlights, colors) end,
  on_highlights = function(hl, tokyoColor)
    local prompt = "#FFA630"
    local text = "#488dff"
    local none = "NONE"

    hl.IndentBlanklineContextChar = { fg = tokyoColor.dark5}
    hl.TSConstructor = {fg = tokyoColor.blue1}
    hl.TSTagDelimiter = {fg = tokyoColor.dark5}

    hl.TelescopeTitle = { fg = prompt, }
    hl.TelescopeNormal = { bg = none, fg = none, }
    hl.TelescopeBorder = { bg = none, fg = text }
    hl.TelescopeMatching = { fg = prompt }
    hl.MsgArea = { fg = tokioColor.fg_dark }
  end,
})

-- Set Colorscheme
vim.cmd('colorscheme ' .. XotoVimGlobal.colorscheme)

-- IF NIGHTLY
if vim.fn.has("nvim-0.8") then

  -- XOTOVIM COLORS
  vim.api.nvim_set_hl(0, 'XotoVimPrimary', { fg = "#488dff" });
  vim.api.nvim_set_hl(0, 'XotoVimSecondary', { fg = "#FFA630" });
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = tokioBorder });

  vim.api.nvim_set_hl(0, 'XotoVimPrimaryBold', { bold = true, fg = "#488DFF" });
  vim.api.nvim_set_hl(0, 'XotoVimSecondaryBold', { bold = true, fg = "#FFA630" });

  vim.api.nvim_set_hl(0, 'XotoVimHeader', { bold = true, fg = "#488DFF" });
  vim.api.nvim_set_hl(0, 'XotoVimHeaderInfo', { bold = true, fg = "#FFA630" });
  vim.api.nvim_set_hl(0, 'XotoVimFooter', { bold = true, fg = "#FFA630" });

  -- Tokyonight Colorscheme Specific Config
  if XotoVimGlobal.colorscheme == 'tokyonight' then

    -- Lines
    vim.api.nvim_set_hl(0, 'CursorLineNR', { link = 'XotoVimSecondary' })
    vim.api.nvim_set_hl(0, 'LineNr', { link = 'Comment' })

    -- Floats/Windows
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "None", fg = "None" });
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "None", fg = tokioBorder });
    vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = "None", fg = "#488DFF" });
    vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = "None" });
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = "None", fg = "#488DFF" });
    vim.api.nvim_set_hl(0, 'BqfPreviewBorder', { link = 'FloatBorder' })

    -- Telescope
    vim.api.nvim_set_hl(0, 'TelescopeTitle', { link = 'XotoVimSecondary' });
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg =  "None" , fg = "None" });
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = "None", fg = tokioBorder });
    vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = tokioBorder, fg = "None" });
    vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = 'XotoVimSecondary' });

    -- Tree
    vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { bg = "None", fg = "None" });
    -- vim.api.nvim_set_hl(0, 'NvimTree', { bg = tokioBorder, fg = tokioBorder});

    -- Diagnostics
    
    -- autopilot
    -- vim.api.nvim_set_hl(0, 'CopilotSuggestion', { bg = "None", fg = tokioColor.dark3 });
    -- vim.api.nvim_set_hl(0, 'GhostTextGroup', { bg = "None", fg = tokioColor.dark3 });
    
    -- Misc
    vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { link = 'Comment' });
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = "None" });
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = "None" });
    vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = tokioColor.blue, ctermfg = 9 });
    vim.api.nvim_set_hl(0, 'Boolean', { fg = "#F7768E" });
    vim.api.nvim_set_hl(0, 'BufferOffset', { link = 'XotoVimSecondary' });

    -- Completion Menu Colors
    local highlights = {
      CmpItemAbbr            = { fg = tokioColor.dark3, bg = "NONE" },
      CmpItemKindClass       = { fg = tokioColor.orange },
      CmpItemKindConstructor = { fg = tokioColor.purple },
      CmpItemKindFolder      = { fg = tokioColor.blue2 },
      CmpItemKindFunction    = { fg = tokioColor.blue },
      CmpItemKindInterface   = { fg = tokioColor.teal, bg = "NONE" },
      CmpItemKindKeyword     = { fg = tokioColor.magneta2 },
      CmpItemKindMethod      = { fg = tokioColor.red },
      CmpItemKindReference   = { fg = tokioColor.red1 },
      CmpItemKindSnippet     = { fg = tokioColor.dark3 },
      CmpItemKindVariable    = { fg = tokioColor.cyan, bg = "NONE" },
      CmpItemKindText        = { fg = "LightGrey" },
      CmpItemMenu            = { fg = "#C586C0", bg = "NONE" },
      CmpItemAbbrMatch       = { fg = "#569CD6", bg = "NONE" },
      CmpItemAbbrMatchFuzzy  = { fg = "#569CD6", bg = "NONE" },
    }

    vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = tokioColor.blue0, bg = tokioBorder })

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end

else

  -- XotoVim Colors
  vim.highlight.create('XotoVimPrimary', { guifg = "#488DFF" }, false);
  vim.highlight.create('XotoVimSecondary', { guifg = "#FFA630" }, false);

  vim.highlight.create('XotoVimPrimaryBold', { gui = "bold", guifg = "#488DFF" }, false);
  vim.highlight.create('XotoVimSecondaryBold', { gui = "bold", guifg = "#FFA630" }, false);

  vim.highlight.create('XotoVimHeader', { gui = "bold", guifg = "#488DFF" }, false);
  vim.highlight.create('XotoVimHeaderInfo', { gui = "bold", guifg = "#FFA630" }, false);
  vim.highlight.create('XotoVimFooter', { gui = "bold", guifg = "#FFA630" }, false);
  
  -- Tokyonight Colorscheme Specific Config
  if XotoVimGlobal.colorscheme == 'tokyonight' then
    -- Lines
    vim.highlight.link('CursorLineNR', 'XotoVimSecondary', true)
    vim.highlight.link('LineNr', 'Comment', true)

    -- Floats/Windows
    vim.highlight.create('NormalFloat', { guibg = "None", guifg = "None" }, false);
    vim.highlight.create('FloatBorder', { guibg = "None" }, false);
    vim.highlight.create('WhichKeyFloat', { guibg = "None" }, false);
    vim.highlight.create('BufferTabpageFill', { guifg = "None" }, false);
    vim.highlight.create('VertSplit', { guibg = "#488DFF", guifg = "#488DFF" }, false);
    vim.highlight.link('BqfPreviewBorder', 'FloatBorder', true)

    -- Telescope
    vim.highlight.link('TelescopeTitle', 'XotoVimSecondary', true);
    vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
    vim.highlight.create('TelescopeBorder', { guibg = "None" }, false);
    vim.highlight.link('TelescopeMatching', 'XotoVimSecondary', true);

    -- Diagnostics

    -- Misc
    vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
    vim.highlight.create('StatusLine', { guibg = "None" }, false);
    vim.highlight.create('StatusLineNC', { guibg = "None" }, false);
    vim.highlight.create('rainbowcol1', { guifg = tokioColor.blue, ctermfg = 9 }, false);
    vim.highlight.create('Boolean', { guifg = "#F7768E" }, false);
    vim.highlight.link('BufferOffset', 'XotoVimSecondary', true);

    -- Completion Menu Colors
    local highlights = {
      CmpItemAbbr            = { fg = tokioColor.dark3, bg = "NONE" },
      CmpItemKindClass       = { fg = tokioColor.orange },
      CmpItemKindConstructor = { fg = tokioColor.purple },
      CmpItemKindFolder      = { fg = tokioColor.blue2 },
      CmpItemKindFunction    = { fg = tokioColor.blue },
      CmpItemKindInterface   = { fg = tokioColor.teal, bg = "NONE" },
      CmpItemKindKeyword     = { fg = tokioColor.magneta2 },
      CmpItemKindMethod      = { fg = tokioColor.red },
      CmpItemKindReference   = { fg = tokioColor.red1 },
      CmpItemKindSnippet     = { fg = tokioColor.dark3 },
      CmpItemKindVariable    = { fg = tokioColor.cyan, bg = "NONE" },
      CmpItemKindText        = { fg = "LightGrey" },
      CmpItemMenu            = { fg = "#C586C0", bg = "NONE" },
      CmpItemAbbrMatch       = { fg = "#569CD6", bg = "NONE" },
      CmpItemAbbrMatchFuzzy  = { fg = "#569CD6", bg = "NONE" },
    }

    vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = tokioColor.blue0 })

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end
