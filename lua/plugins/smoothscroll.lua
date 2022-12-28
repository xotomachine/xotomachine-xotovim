local M = {}

function M.config()
  local status_ok, neoscroll = pcall(require, "neoscroll")
  if not status_ok then
    return
  end
  
  neoscroll.setup {
    -- all these keys will be mapped to their corresponding default scrolling animation
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
    hide_cursor = true, -- hide cursor while scrolling
    stop_eof = true, -- stop at <eof> when scrolling downwards
    use_local_scrolloff = false, -- use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false, -- stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- the cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil, -- default easing function
    pre_hook = nil, -- function to run before the scrolling animation starts
    post_hook = nil, -- function to run after the scrolling animation ends
  }
end

return M