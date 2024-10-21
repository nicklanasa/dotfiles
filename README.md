# System setup

## Install emacs for OS X and setup packages

https://emacsformacosx.com

``` sh
ln -s ~/dotfiles/.config/doom ~/.doom.d
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install 

xargs brew install < leaves
xargs brew install --cask < casks
    
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Symlink config files

``` sh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```


## Setup android studio

``` sh
brew info --cask zulu@17

# Navigate to the folder
open /opt/homebrew/Caskroom/zulu@17/<version number> # or /usr/local/Caskroom/zulu@17/<version number>
```


After opening Finder, double click the Double-Click to Install Azul Zulu JDK 17.pkg package to install the JDK.

Install the following in Android Studio:

1. Android 15
2. Android SDK Platform 35
3. Google APIs ARM 64 v8a System Image

In "SDK Tools" check the box next to "Show Package Details" -> "Android SDK Build-Tools" entry, then make sure that 35.0.0 is selected.
