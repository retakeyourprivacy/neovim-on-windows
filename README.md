# Neovim on Windows

All the alterations needed to get Neovim working on Windows.

Right now, this is just the cmd.lua with the correct path.

## Instructions

Create an nvim directory within the `~/AppData/Local` directory. Then, copy the dotfiles for Neovim into the nvim directory.

Swap out the cmd.lua in the dotfiles with the one located in this repo, as it has the correct path syntax for Windows.

Remove the following files from the `after\plugin` directory:
- lsp.lua
- treesitter.lua

Manually add the following file into the `autoload` directory:
- [plug.vim](https://github.com/junegunn/vim-plug)

When next running Neovim, do a manual `:PlugInstall` to install all the plugins.

## Future features:

- Consider fixing the plug.vim installer
- Consider fixing the treesitter.lua plugin
