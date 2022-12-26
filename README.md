# XotoVim: Neovim Config

[![Last commit](https://img.shields.io/github/last-commit/xotomachine/xotomachine-xotovim?style=for-the-badge)](https://github.com/xotomachine/xotomachine-xotovim/commits/development)
![Stars](https://img.shields.io/github/stars/xotomachine/xotomachine-xotovim?style=for-the-badge)
![License](https://img.shields.io/github/license/xotomachine/xotomachine-xotovim?style=for-the-badge)
![Neovim Version](https://img.shields.io/badge/For%20Neovim-0.8+-yellowgreen?style=for-the-badge&logo=neovim&logoColor=d8abbb&color=d8abbb)

### A non-minimal Neovim config built to work most efficiently with any development

## Features 💠

- Recommended default theme: [Tokyonight](https://github.com/folke/tokyonight.nvim)
- Highly performant even with a lot of plugins
- Lazy loaded
- Extendable LSP configuration
- Support for [TailwindCSS](https://tailwindcss.com/) with highlighted colors
- Support for [Tabnine](https://www.tabnine.com/) and copilot
- JSON autocompletion for most popular Frontend config
- NPM packages autocompletion
- Internal [Jest](https://github.com/facebook/jest) testing
- Treesitter-based folding
- Git management with [Lazygit](https://github.com/jesseduffield/lazygit), custom telescope commits view with [git-delta](https://github.com/dandavison/delta), [gitsigns](https://github.com/lewis6991/gitsigns.nvim) & [diffview](https://github.com/sindrets/diffview.nvim), custom git blame

And of course usage of [telescope](https://github.com/nvim-telescope/telescope.nvim), [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua), [barbar](https://github.com/romgrk/barbar.nvim), [cmp](https://github.com/hrsh7th/nvim-cmp), [treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [blankline](https://github.com/lukas-reineke/indent-blankline.nvim) & more!

## Screenshots 📸

Dashboard

![Dashboard](./.screenshots/1-alpha.png)

## Installation ⚡️

Copy it into your terminal:

```bash
bash <(curl -s https://raw.githubusercontent.com/xotomachine/xotomachine-xotovim/development/.install/run.sh)
```

After install configuration:

1. Treesitter Languages are <ins>installed</ins> by default.\
   If you wish to add more of them make sure to run `:TSInstall <lang>` for specific language you want to install and configure them in the lsp folder. 
2. LSP servers are enabled by default. You can check installed LSP servers by :Mason command.

## Configuration 💻

To change XotoVim related config use the `config.lua` file.\
To change vim settings use the `settings.lua` file.

## Next list for updates 📝

| Description                                     | Progress                                                           |
|-------------------------------------------------|--------------------------------------------------------------------|
| Create npx auto-installer & uninstaller         | ![50%](https://progress-bar.dev/50/?title=progress)                |
| Easy user configurable config                   | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| Better configuration of additional LSPs         | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| Better support for null-ls and local formatting | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |

## Future Todo 🔥

| Description                                            | Progress                                                           |
|--------------------------------------------------------|--------------------------------------------------------------------|
| Project Logo                                           | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| Auto resize for more consistent UI behavior            | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| Reload in-time support                                 | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| Support more LSPs (not only frontend?)                 | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| More built-in themes (lazy loaded)                     | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| Better UI customization when nvim 0.8 will be in ready | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |

## Done ✅

| Description                                  | Progress                                                       |
|----------------------------------------------|----------------------------------------------------------------|
| Better support to project word refactor      | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Support for nvim-dap debugger for React      | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Support ESLint & Prettier in Native LSP      | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Replace coc-explorer with nvim-tree.lua      | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Replace coc.nvim with Native LSP             | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Change fzf.nvim to telescope.nvim            | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Update statusline to support LSP diagnostics | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Rewrite most config to lua                   | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Support TailwindCSS with colors              | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Provide current screenshots                  | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Create shell installer for Linux & MacOS     | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
