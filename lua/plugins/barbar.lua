-- Set barbar's options
require'bufferline'.setup {
    animation = true, -- enable/disable animations
    auto_hide = false, -- enable/disable auto-hiding the tab bar when there is a single buffer
    tabpages = false, -- enable/disable current/total tabpages indicator (top right corner)
    closable = true, -- enable/disable close button
    clickable = true, -- enables/disable clickable tabs --  - left-click: go to buffer --  - middle-click: delete buffer
    exclude_ft = {'qf'}, -- excludes buffers from the tabline -- exclude_name = ['package.json'],
    icons = 'both', -- enable/disable icons -- if set to 'numbers', will show buffer index in the tabline -- if set to 'both', will show buffer index and icons in the tabline
    icon_custom_colors = false, -- if set, the icon color will follow its corresponding buffer -- highlight group. by default, the buffer*icon group is linked to the -- buffer* group (see highlighting below). otherwise, it will take its -- default value as defined by devicons.
    icon_separator_active = '▎', -- configure icons on the bufferline.
    icon_separator_inactive = '▎',
    icon_close_tab = ' ',
    icon_close_tab_modified = '● ',
    icon_pinned = '車 ',
    insert_at_end = false, -- if true, new buffers will be inserted at the end of the list. -- default is to insert after current buffer.
    maximum_padding = 2, -- sets the maximum padding width with which to surround each tab
    maximum_length = 30, -- sets the maximum buffer name length.
    semantic_letters = true, -- if set, the letters for each buffer in buffer-pick mode will be -- assigned based on their name. otherwise or in case all letters are -- already assigned, the behavior is to assign letters in order of -- usability (see order below)
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP', -- new buffer letters are assigned in this order. this order is -- optimal for the qwerty keyboard layout but might need adjustement -- for other layouts.
    no_name_title = nil, -- sets the name of unnamed buffers. by default format is "[buffer x]" -- where x is the buffer number. but only a static string is accepted here.
  }
