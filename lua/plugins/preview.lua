require('goto-preview').setup {
	width = 85; -- width of the floating window
	height = 25; -- height of the floating window
	border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- border characters of the floating window
	default_mappings = false; -- bind default mappings
	debug = false; -- print debug information
	opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
	resizing_mappings = false; -- binds arrow keys to resizing the floating window.
	post_open_hook = nil; -- a function taking two arguments, a buffer and a window to be ran as a hook.
	references = { -- configure the telescope ui for slowing the references cycling window.
	  telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
	};
	-- these two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
	focus_on_open = true; -- focus the floating window when opening it.
	dismiss_on_move = false; -- dismiss the floating window when moving the cursor.
	force_close = true, -- passed into vim.api.nvim_win_close's second argument. see :h nvim_win_close
	bufhidden = "wipe", -- the bufhidden option to set on the floating window. see :h bufhidden
  }