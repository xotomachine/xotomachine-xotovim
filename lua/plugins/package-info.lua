local icons = XotoVimGlobal.icons

require('package-info').setup
    {
      colors = {
        up_to_date = "#3C4048", -- text color for up to date package virtual text
        outdated = "#fc514e", -- text color for outdated package virtual text
      },

      icons = {
        enable = true, -- whether to display icons
        style = {
          up_to_date = icons.checkSquare, -- icon for up to date packages
          outdated = icons.gitRemove, -- icon for outdated packages
        },
        
      },

      autostart = true, -- whether to autostart when `package.json` is opened
      hide_up_to_date = true, -- it hides up to date versions when displaying virtual text
      hide_unstable_versions = true, -- it hides unstable versions from version list e.g next-11.1.3-canary3

      package_manager = 'yarn' -- can be `npm` or `yarn`. used for `delete`, `install` etc... -- the plugin will try to auto-detect the package manager based on -- `yarn.lock` or `package-lock.json`. if none are found it will use the -- provided one, if nothing is provided it will use `yarn`
    }

-- keymappings are set in which key config
