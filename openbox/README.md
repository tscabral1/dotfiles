# Install and configure Openbox on Arch Linux or Arch Linux based distros

1. Do minimal Arch installation
2. Install wget
3. wget https://raw.githubusercontent.com/tscabral1/dotfiles/main/openbox/install.sh
4. bash install.sh
5. Reboot
6. Install FiraCode font
```
yay -s ttf-firacode-nerd
```
8. Activate trackpad gestures
```
wget -O - https://raw.githubusercontent.com/tscabral1/dotfiles/main/openbox/postinstall2.sh | bash
```

## Firefox theme

Log into: https://addons.mozilla.org

Download:
https://addons.mozilla.org/firefox/downloads/file/4088983/40d0f4ca6aa84191b226-5.0.xpi

Dark Reader (extension) theme:
https://github.com/catppuccin/dark-reader

## Apply Nvchad to Neovim
1. Clone repo
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
2. Install Catppuccin Mocha theme
```
sudo mkdir ~/.config/nvim/lua/custom/themes
cd ~/.config/nvim/lua/custom/themes
sudo wget https://raw.githubusercontent.com/tscabral1/dotfiles/main/nvim/lua/custom/themes/catppuccin-mocha.lua
```

3. To change theme: leader key + th

To add auto-save plugin to Nvchad:
- Paste right after "local plugins = {" in /nvim/lua/custom/plugins.lua :
```
{"Pocco81/auto-save.nvim", lazy = false },
``` 
- Add to trigger_events in $HOME/.local/share/nvim/lazy/auto-save.nvim/lua/auto-save/config.lua:
```
"InsertCharPre"
``` 
- Close and reopen Neovim

To add ts and tsx autotag/autocomplete to Nvchad:
- Install emmet-ls
```
sudo npm install -g emmet-ls
```
- Add to $HOME/.config/nvim/lua/custom/configs/lspconfig.lua
```
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "eruby", "html", "markdown", "javascript", "javascriptreact", "typescriptreact", "typescript", "tsx", "ts", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})
```
