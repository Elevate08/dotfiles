### DotFiles management

I use stow to manage my dotfiles.

By cloning the repo, ensuring zsh is installed, and setting a couple variables you'll be on your way.

```
export DOTFILES=~/.dotfiles
export STOW_FOLDERS="alias,dunst,fontconfig,git,gnupg,gtk,input,neofetch,nvim,power,profile,statusbar,tmux,wget,xinit,yarn,zathura,zsh"
```

You can now run

```
./install
```

Of course, for some of these configs to load you will need to have the package installed as well.

- [dwm](https://github.com/Elevate08/dwm)
- [dmenu](https://github.com/Elevate08/dmenu)
- [dwmblocks](https://github.com/Elevate08/dwmblocks)
- dunst
- git
- [neovim](https://github.com/neovim/neovim)
- tmux
- zsh
