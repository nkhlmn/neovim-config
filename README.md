## Installation instructions for macOS

### 1. Clone configuration

`git clone https://github.com/nikhilkamineni/neovim-config.git ~/.config/nvim`

### 2. Install minpac

`git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac`

### 3. Open neovim and install plugins

`:PackUpdate`

### 4. Setup CoC (https://github.com/neoclide/coc.nvim)

- a. Build CoC
  `:call coc#util#build()`

- b. Install CoC extensions
  `:CocInstall coc-json coc-tsserver coc-html coc-css coc-pyls coc-emmet coc-pairs`
