local keymap = vim.keymap.set
local silent = { silent = true }

-- Better window movement
keymap("n", "<C-h>", "<C-w>h", silent)
keymap("n", "<C-j>", "<C-w>j", silent)
keymap("n", "<C-k>", "<C-w>k", silent)
keymap("n", "<C-l>", "<C-w>l", silent)

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenting
-- keymap("v", "<", "<gv", silent)
-- keymap("v", ">", ">gv", silent)

-- Case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`>", "U", silent)

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Telescope
keymap("n", "<C-p>", "<CMD>lua require('plugins.telescope').project_files()<CR>")
keymap("n", "<leader>q", "<CMD>lua require('plugins.telescope.pickers.multi-rg')()<CR>")

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- Find word/file across project
keymap("n", "<leader>pf", "<CMD>lua require('plugins.telescope').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>")
keymap("n", "<leader>pw", "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>")

-- Buffers
-- keymap("n", "<leader><Tab>", ":BufferNext<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
-- keymap("n", "<leader><Tab>", ":BufferPrevious<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<leader>q", ":BufferClose<CR>", silent)

-- Move between barbar buffers
keymap("n", "<leader>1", ":BufferGoto 1<CR>", silent)
keymap("n", "<leader>2", ":BufferGoto 2<CR>", silent)
keymap("n", "<leader>3", ":BufferGoto 3<CR>", silent)
keymap("n", "<leader>4", ":BufferGoto 4<CR>", silent)
keymap("n", "<leader>5", ":BufferGoto 5<CR>", silent)
keymap("n", "<leader>6", ":BufferGoto 6<CR>", silent)
keymap("n", "<leader>7", ":BufferGoto 7<CR>", silent)
keymap("n", "<leader>8", ":BufferGoto 8<CR>", silent)
keymap("n", "<leader>9", ":BufferGoto 9<CR>", silent)

-- Don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Quickfix
-- keymap("n", "<leader>,", ":cp<CR>", silent)
-- keymap("n", "<leader>.", ":cn<CR>", silent)

-- Toggle quicklist
-- keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Easyalign
keymap("n", "ga", "<Plug>(EasyAlign)", silent)
keymap("x", "ga", "<Plug>(EasyAlign)", silent)

-- Manually invoke speeddating in case switch.vim didn't work
keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", silent)
keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>", silent)

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- Refactor with spectre
keymap("n", "<leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", silent)
keymap("v", "<leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
-- keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
-- keymap("v", "<leader>la", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
-- keymap("v", "<leader>lf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next()<CR>", silent)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev()<CR>", silent)

keymap("n", "K", function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)

-- keymap("n", "K", function()  
--   local params = vim.lsp.util.make_position_params()
--   return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
-- end)

vim.api.nvim_set_keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "gpq", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
