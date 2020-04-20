dotfiles
========

My current set of configuration files:

* [i3](https://i3wm.org/)
* [URxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode)
* [zsh](http://zsh.sourceforge.net/), mostly using [Prezto](https://github.com/sorin-ionescu/prezto)
* [Neovim](https://neovim.io/)
* [NeoMutt](https://neomutt.org/)
* [Qutebrowser](https://qutebrowser.org/)

## For Neovim
1. Set up [vim-plug](https://github.com/junegunn/vim-plug)

   ```
   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

2. Install the plugins:

   Launch `nvim` and run `:PlugInstall`
