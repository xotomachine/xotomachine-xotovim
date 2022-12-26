require("nvim-surround").setup({ -- defines plugin keymaps
	keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
    },  
    
	surrounds = {  -- defines surround keys and behavior
		["("] = { add = { "( ", " )" }, find = function() return M.get_selection({ motion = "a(" }) end, delete = "^(. ?)().-( ?.)()$", },
        [")"] = { add = { "(", ")" }, find = function() return M.get_selection({ motion = "a)" }) end, delete = "^(.)().-(.)()$", },
        ["{"] = { add = { "{ ", " }" }, find = function() return M.get_selection({ motion = "a{" }) end, delete = "^(. ?)().-( ?.)()$", },
        ["}"] = { add = { "{", "}" }, find = function() return M.get_selection({ motion = "a}" }) end, delete = "^(.)().-(.)()$", },
        ["<"] = { add = { "< ", " >" }, find = function() return M.get_selection({ motion = "a<" }) end, delete = "^(. ?)().-( ?.)()$", },
        [">"] = { add = { "<", ">" }, find = function() return M.get_selection({ motion = "a>" }) end, delete = "^(.)().-(.)()$", },
        ["["] = { add = { "[ ", " ]" }, find = function() return M.get_selection({ motion = "a[" }) end, delete = "^(. ?)().-( ?.)()$", },
        ["]"] = { add = { "[", "]" }, find = function() return M.get_selection({ motion = "a]" }) end, delete = "^(.)().-(.)()$", },
        ["'"] = { add = { "'", "'" }, find = function() return M.get_selection({ motion = "a'" }) end, delete = "^(.)().-(.)()$", },
        ['"'] = { add = { '"', '"' }, find = function() return M.get_selection({ motion = 'a"' }) end, delete = "^(.)().-(.)()$", },
        ["`"] = { add = { "`", "`" }, find = function() return M.get_selection({ motion = "a`" }) end, delete = "^(.)().-(.)()$", },
	},
    
	aliases = {  -- defines aliases
        ["a"] = ">",
        ["b"] = ")",
        ["B"] = "}",
        ["r"] = "]",
        ["q"] = { '"', "'", "`" },
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
    
	highlight = { -- defines highlight behavior
		duration = 200
	}, 
    
	move_cursor = true -- defines cursor behavior,
})