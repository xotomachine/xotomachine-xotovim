local options = {
  clipboard      = "unnamed,unnamedplus", --- copy-paste between vim and everything else
  cmdheight      = 2, --- give more space for displaying messages
  completeopt    = "menu,menuone,noselect", --- better autocompletion
  cursorline     = true, --- highlight of current line
  emoji          = false, --- fix emoji display
  expandtab      = true, --- use spaces instead of tabs
  foldcolumn     = "0",
  foldnestmax    = 0,
  foldlevel      = 99, --- using ufo provider need a large value
  foldlevelstart = 99, --- expand all folds by default
  ignorecase     = true, --- needed for smartcase
  laststatus     = 3, --- have a global statusline at the bottom instead of one for each window
  lazyredraw     = true, --- makes macros faster & prevent errors in complicated mappings
  mouse          = "a", --- enable mouse
  number         = true, --- shows current line number
  pumheight      = 10, --- max num of items in completion menu
  relativenumber = false, --- enables relative number
  scrolloff      = 8, --- always keep space when scrolling to bottom/top edge
  shiftwidth     = 2, --- change a number of space characeters inseted for indentation
  showtabline    = 2, --- always show tabs
  signcolumn     = "yes:3", --- add extra sign column next to line number
  smartcase      = true, --- uses case in search
  smartindent    = true, --- makes indenting smart
  smarttab       = true, --- makes tabbing smarter will realize you have 2 vs 4
  softtabstop    = 2, --- insert 2 spaces for a tab
  
  splitbelow     = true, -- Splitting a new window below the current one
  splitright     = true, --- vertical splits will automatically be to the right
  
  swapfile       = false, --- swap not needed
  tabstop        = 2, --- insert 2 spaces for a tab
  termguicolors  = true, --- correct terminal colors

  timeoutlen     = 200, --- faster completion (cannot be lower than 200 because then commenting doesn't work)
  undofile       = true, --- sets undo to file
  updatetime     = 100, --- faster completion
  viminfo        = "'1000", --- increase the size of file history
  wildignore     = "*node_modules/**", --- don't search inside node.js modules (works for gutentag)
  wrap           = true, --- display long lines as just one line
  writebackup    = false, --- not needed
  
  spelllang      = "en", -- Support US english
  hidden         = true, -- Ignore unsaved buffers
  hlsearch       = true, -- Highlight all the matches of search patternhlsearch = true -- Highlight all the matches of search pattern
  
  -- neovim defaults
  autoindent     = true, --- good auto indent
  backspace      = "indent,eol,start", --- making sure backspace works
  backup         = false, --- recommended by coc
  conceallevel   = 0, --- show `` in markdown files
  encoding       = "utf-8", --- the encoding displayed
  errorbells     = false, --- disables sound effect for errors
  fileencoding   = "utf-8", --- the encoding written to file
  incsearch      = true, --- start searching before pressing enter
  showmode       = false, --- don't show things like insert anymore
}

local globals = {
  mapleader                   = ' ', --- map leader key to spc
  speeddating_no_mappings     = 1, --- disable default mappings for speeddating
}

vim.opt.shortmess:append('c');
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
vim.opt.fillchars:append('stl: ');
vim.opt.fillchars:append('eob: ');
vim.opt.fillchars:append('fold: ');
vim.opt.fillchars:append('foldopen: ');
vim.opt.fillchars:append('foldsep: ');
vim.opt.fillchars:append('foldclose:');

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
