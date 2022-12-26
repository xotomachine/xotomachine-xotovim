require('fm-nvim').setup {
    edit_cmd = "edit", -- (vim) command used to open files
    on_close = {}, -- see `q&a` for more info
    on_open = {},
    
    ui = { -- ui options
        default = "float", -- default ui (can be "split" or "float")

        float = {
            border = "none", -- floating window border (see ':h nvim_open_win')
            border_hl = "FloatBorder",
            blend = 0, -- floating window transparency (see ':h winblend')
            height = 1, -- num from 0 - 1 for measurements
            width = vim.fn.winwidth(0),
            x = 0.5, -- x and y axis of window
            y = 0.5 -- x and y axis of window
        },

        split = {
            direction = "topleft", -- direction of split
            size = 24 -- size of split
        }
    },

    cmds = { -- terminal commands used w/ file manager (have to be in your $path)
        lf_cmd = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
        fm_cmd = "fm",
        nnn_cmd = "nnn",
        fff_cmd = "fff",
        twf_cmd = "twf",
        fzf_cmd = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
        fzy_cmd = "find . | fzy",
        xplr_cmd = "xplr",
        vifm_cmd = "vifm",
        skim_cmd = "sk",
        broot_cmd = "broot",
        gitui_cmd = "gitui",
        ranger_cmd = "ranger",
        joshuto_cmd = "joshuto",
        lazygit_cmd = "lazygit",
        neomutt_cmd = "neomutt",
        taskwarrior_cmd = "taskwarrior-tui"
    },

    mappings = { -- mappings used with the plugin
        vert_split = "<C-v>",
        horz_split = "<C-h>",
        tabedit = "<C-t>",
        edit = "<C-e>",
        ESC = "<ESC>"
    },
    -- path to broot config
    broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson"
}
