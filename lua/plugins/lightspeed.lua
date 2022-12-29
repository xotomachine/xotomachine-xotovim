-- ╭──────────────────────────────────────────────────────────╮
-- │ setup                                                    │
-- ╰──────────────────────────────────────────────────────────╯
require'lightspeed'.setup {
	ignore_case = false,
	exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
	jump_to_unique_chars = { safety_timeout = 300 },
	match_only_the_start_of_same_char_seqs = true,
	force_beacons_into_match_width = false,
	
	substitute_chars = { ['\r'] = '¬', }, -- display characters in a custom way in the highlighted matches.
	
	-- safe_labels = { . . . }, -- leaving the appropriate list empty effectively disables "smart" mode, -- and forces auto-jump to be on or off.
	-- labels = { . . . },
	
	special_keys = { -- these keys are captured directly by the plugin at runtime.
	  next_match_group = '<Tab>',
	  prev_match_group = '<S-Tab>',
	},
	
	--- f/t ---
	limit_ft_matches = 5,
	repeat_ft_with_target_char = false,
  }

local silent = { silent = true }

vim.keymap.del("n", "S", silent)
vim.keymap.del("n", "s", silent)
vim.keymap.set("n", "s", "<Plug>Lightspeed_omni_s", silent)

