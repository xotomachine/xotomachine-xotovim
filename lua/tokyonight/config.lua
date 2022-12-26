local M = {}

local tokioColor = require("tokyonight.colors")
local tokioBorder = "#34384f";

---@class Config
---@field on_colors fun(colors: ColorScheme)
---@field on_highlights fun(highlights: Highlights, colors: ColorScheme)
local defaults = {
  
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
    
    sidebars = "dark", -- style for sidebars -- background styles. Can be "dark", "transparent" or "normal"
    floats = "transparent", -- style for floating windows
  },

  use_background = auto, -- can be light/dark/auto. When auto, background will be set to vim.o.background
  sidebars = { "qf", "vista_kind", "terminal", "packer", "spectre_panel", "NeogitStatus", "help" }, -- set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`

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
  
}

---@type Config
M.options = {}

---@param options Config|nil
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

---@param options Config|nil
function M.extend(options)
  M.options = vim.tbl_deep_extend("force", {}, M.options or defaults, options or {})
end

function M.is_day()
  return M.options.style == "day" or M.options.use_background and vim.o.background == "light"
end

M.setup()

return M
