# Neovim on Windows

All the alterations needed to get Neovim working on Windows.

## Installation

Install `chocolatey` with the following command in an administrative Powershell:

```
winget install chocolatey
```

Install `git` and `neovim`.

Create an `nvim` directory within the `~/AppData/Local` directory. Then, clone the base Neovim configs into the `nvim` directory.

Swap out the `cmd.lua` and `.gitignore` in the configs with the one located in this repo.

Comment out the following files from the `after\plugin` directory:
- lsp.lua
- treesitter.lua

Manually add the following file into the `autoload` directory:
- [plug.vim](https://github.com/junegunn/vim-plug)

When next running Neovim, do a manual `:PlugInstall` to install all the plugins.

## Future features:

- Consider fixing the plug.vim installer
- Consider fixing the treesitter.lua plugin
