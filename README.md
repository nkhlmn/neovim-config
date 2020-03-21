## Installation instructions for macOS

### 1. Clone configuration

`git clone https://github.com/nikhilkamineni/neovim-config.git ~/.config/nvim`

### 2. Instal `neovim` npm package

`npm i -g neovim`

### 3. Open neovim and install plugins

`:PlugUpdate`

### 4. Setup CoC (https://github.com/neoclide/coc.nvim)

Install CoC extensions (`:CocInstall <extension-name>`)

- General
  - coc-lists
  - coc-pairs
  - coc-highlight
  - coc-git
- Language specific:
  - coc-json
  - coc-tsserver
  - coc-html
  - coc-css
  - coc-emmet
  - coc-markdownlint
