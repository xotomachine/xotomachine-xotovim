-- -- https://github.com/lukas-reineke/indent-blankline.nvim
-- vim.opt.list = true
-- -- vim.opt.listchars:append("space:⋅")
-- -- vim.opt.listchars:append("eol:↴")

-- require("indent_blankline").setup {
--     char = "",
--     show_first_indent_level = true,
--     buftype_exclude = {"terminal", "telescope", "nofile"},
--     filetype_exclude = {"help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float"},
--     show_current_context = true,
--     show_current_context_start = false,
--     show_end_of_line = false,
--     show_trailing_blankline_indent = false,
--     space_char_blankline = " ",
--     use_treesitter = true
-- }


-- https://github.com/lukas-reineke/indent-blankline.nvim

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]


require("indent_blankline").setup {
  buftype_exclude = {"terminal", "telescope", "nofile"},
  filetype_exclude = {"help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float"},
  show_current_context = true,
  show_current_context_start = false,
  show_end_of_line = false,
  show_trailing_blankline_indent = false,
  space_char_blankline = " ",
  char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
  },
  use_treesitter = true,
}




-- require("indent_blankline").setup {
--   space_char_blankline = " ",
--   show_current_context = true,
--   show_current_context_start = true,
-- }