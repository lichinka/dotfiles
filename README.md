dotfiles
========

My current set of configuration files for URxvt, ZSh (using [Prezto](https://github.com/sorin-ionescu/prezto)), Neovim and NeoMutt.-


## For Neovim
1. Set up [vim-plug](https://github.com/junegunn/vim-plug)

   ```
   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

2. Install the plugins:

   Launch `nvim` and run `:PlugInstall`
