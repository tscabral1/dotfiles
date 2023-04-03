# Install and configure Openbox on Arch Linux or Arch Linux based distros

1. Do minimal Arch installation
2. Install wget
3. wget https://raw.githubusercontent.com/tscabral1/dotfiles/main/openbox/install.sh
4. bash install.sh
5. Reboot
6. yay -s ttf-firacode-nerd

```
wget -O - https://raw.githubusercontent.com/tscabral1/dotfiles/main/openbox/postinstall2.sh | bash

```

## Firefox theme

Log into: https://addons.mozilla.org

Download:
https://addons.mozilla.org/firefox/downloads/file/4088983/40d0f4ca6aa84191b226-5.0.xpi

## Apply Nvchad to Neovim
1. git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
2. sudo mkdir ~/.config/nvim/lua/custom/themes
3. cd ~/.config/nvim/lua/custom/themes
4. sudo wget https://raw.githubusercontent.com/tscabral1/dotfiles/main/nvim/lua/custom/themes/catppuccin-mocha.lua

To change theme: leader key + th
