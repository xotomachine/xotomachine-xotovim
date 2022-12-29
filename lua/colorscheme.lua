-- local present, tokyonight = pcall(require, "tokyonight")
-- if not present then
--   return
-- end

local tokioColor = require("tokyonight.colors")
local XotoVimPrimary = "#242738";
local XotoVimPrimaryLight = "#34384f";
local XotoVimSecondary = "#e8ab5a";

local util = require("tokyonight.util")
local theme = require("tokyonight.theme")

util.load(theme.setup())

-- ╭──────────────────────────────────────────────────────────╮
-- │ setup colorscheme                                        │
-- ╰──────────────────────────────────────────────────────────╯
-- vim.cmd('colorscheme ' .. XotoVimGlobal.colorscheme) -- Set Colorscheme

-- if nightly
if vim.fn.has("nvim-0.8") then

  -- xotovim global colors
  vim.api.nvim_set_hl(0, 'XotoVimPrimary', { fg = XotoVimPrimary });
  vim.api.nvim_set_hl(0, 'XotoVimSecondary', { fg = XotoVimSecondary });
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = XotoVimPrimary });

  vim.api.nvim_set_hl(0, 'XotoVimPrimaryBold', { bold = true, fg = XotoVimPrimary });
  vim.api.nvim_set_hl(0, 'XotoVimSecondaryBold', { bold = true, fg = XotoVimSecondary });

  vim.api.nvim_set_hl(0, 'XotoVimHeader', { bold = true, fg = XotoVimPrimaryLight });
  vim.api.nvim_set_hl(0, 'XotoVimHeaderInfo', { bold = true, fg = XotoVimSecondary });
  vim.api.nvim_set_hl(0, 'XotoVimFooter', { bold = true, fg = XotoVimSecondary });

  -- tokyonight colorscheme specific config
  if XotoVimGlobal.colorscheme == 'tokyonight' then

    -- lines
    vim.api.nvim_set_hl(0, 'CursorLineNR', { link = 'XotoVimSecondary' })
    vim.api.nvim_set_hl(0, 'LineNr', { link = 'Comment' })

    -- floats/windows
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "None", fg = "None" });
    vim.api.nvim_set_hl(0, 'RegistersWindow', { bg = "None", fg = "None" });
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "None", fg = XotoVimPrimaryLight });
    vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = XotoVimPrimaryLight, fg = "None" });
    vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = "None", fg = XotoVimPrimary });
    vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = "None" });
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = "None", fg = XotoVimPrimary });
    vim.api.nvim_set_hl(0, 'BqfPreviewBorder', { link = 'FloatBorder' })

    -- telescope
    vim.api.nvim_set_hl(0, 'TelescopeTitle', { link = 'XotoVimSecondary' });
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg =  "None" , fg = "None" });
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = "None", fg = XotoVimPrimaryLight });
    vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = XotoVimPrimary, fg = "None" });
    vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = 'XotoVimSecondary' });

    -- tree
    vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { bg = "None", fg = "None" });

    -- autopilot
    vim.api.nvim_set_hl(0, 'CopilotSuggestion', { bg = "None", fg = tokioColor.dark3 });
    
    -- misc
    vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { link = 'Comment' });
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = "None" });
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = "None" });
    vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = tokioColor.blue, ctermfg = 9 });
    vim.api.nvim_set_hl(0, 'Boolean', { fg = "#F7768E" });
    vim.api.nvim_set_hl(0, 'BufferOffset', { link = 'XotoVimSecondary' });

    -- completion menu colors
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

    vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = tokioColor.blue0, bg = XotoVimPrimaryLight })

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end
