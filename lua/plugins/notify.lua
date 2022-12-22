require("notify").setup({
	background_colour = 'FloatShadow', -- For stages that change opacity this is treated as the highlight behind the window. Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
	stages = "fade_in_slide_out", -- Animation style (see below for details)
	on_open = nil, -- Function called when a new window is opened, use for changing win settings/config
	on_close = nil, -- Function called when a window is closed
	render = "default", -- Render function for notifications. See notify-render()
	timeout = 5000, -- Default timeout for notifications
	minimum_width = 10, -- Minimum width for notification windows
	icons = { -- Icons for the different levels
	  ERROR = "",
	  WARN = "",
	  INFO = "",
	  DEBUG = "",
	  TRACE = "✎",
	},
  })
