require('Comment').setup({
  padding = true, --- add a space b/w comment and the line ---@type boolean
  ignore = nil, --- lines to be ignored while comment/uncomment. ---could be a regex string or a function that returns a regex string. ---example: use '^$' to ignore empty lines ---@type string|function
  sticky = true, --- whether cursor should stay at the ---same position. only works in normal ---mode mappings --- create basic (operator-pending) and extended mappings for normal + visual mode
  
  mappings = { --- @type table
      basic = true, --- operator-pending mapping ---includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
      extra = true, --- extra mapping ---includes `gco`, `gcO`, `gcA`
      extended = false, --- extended mapping ---includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
  },
  
  toggler = { --- lhs of toggle mapping in normal + visual mode ---@type table
      line = 'gcc', --- line-comment keymap
      block = 'gbc', --- block-comment keymap
  },
  
  opleader = { --- lhs of operator-pending mapping in normal + visual mode ---@type table
      line = 'gc', --- line-comment keymap
      block = 'gb', --- block-comment keymap
  },
  
  pre_hook = function() --- pre-hook, called before commenting the line ---@type function|nil
    return require('ts_context_commentstring.internal').calculate_commentstring()
  end,
  post_hook = nil, --- post-hook, called after commenting is done ---@type function|nil
})
