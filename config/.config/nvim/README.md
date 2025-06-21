# My Neovim Config
This is my personal Neovim setup built entirely in Lua. It's designed to boost productivity, provide a smooth developer experience, and remain lightweight compared to full-featured IDEs. The configuration includes built-in support for LSP, Treesitter, formatting, and debugging for common languages like Shell, Lua, JavaScript, TypeScript, PHP, and Java. It is easy to extend, so you can quickly add support for more languages or features as your needs grow.

## Preview
Here’s a preview of what my Neovim setup looks like in action:

<p align="center">
  <img src="https://github.com/user-attachments/assets/22bdec48-805d-411e-ba1d-8ca2d39be30b" alt="image 1" width="45%" style="margin-right: 5%;">
  <img src="https://github.com/user-attachments/assets/df7aa2e9-77db-4091-b02e-eb7fdaa531f5" alt="image 2" width="45%">
</p>

## Installation
To install my Neovim configuration, simply clone the repository and symlink it to your Neovim config directory:
```sh
git clone https://github.com/ndy-s/nvim-config.git ~/.config/nvim
```
This will ensure that your Neovim setup is configured with my custom settings, plugins, and keymaps.

## Setup & Plugins
For full keymaps reference: [My Neovim Notes](https://github.com/ndy-s/nvim-config/blob/main/docs/nvim-notes.md)

All plugins used in this setup are organized inside the `lua/plugins` folder for easy maintenance and scalability. You can browse them directly to see what's included and how they are configured.

## FAQ
How do I update this config? Simply pull the latest changes from the repository:
```sh
git pull origin main
```
