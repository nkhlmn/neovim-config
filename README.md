## Installation instructions for macOS/linux

### 1. Clone configuration

`git clone https://github.com/nikhilkamineni/neovim-config.git ~/.config/nvim`

### 2. Install plugins

`$ nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'`

Not totally foolproof. May need to open and run `PackerSync` again

### 3. Install `neovim` npm package (optional)

`npm i -g neovim`

### 5. Install language servers (optional)

`:LspInstallInfo`

### 6. Install treesitter parsers (optional)

`:TSInstall <parsers to install>`
