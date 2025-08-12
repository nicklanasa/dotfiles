Dotfiles Setup (Mac)

1. Install Homebrew Packages

``` sh
xargs brew install < leaves
xargs brew install --cask < casks
sudo xcodebuild -license accept

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Symlink Config Files

``` sh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

3. Install Emacs with Doom

``` sh
brew tap d12frosted/emacs-plus
brew reinstall emacs-plus \
  --with-imagemagick \
  --with-xwidgets \
  --with-mailutils \
  --with-c9rgreen-sonoma-icon

cd ~
ln -s /Users/nick/dotfiles/.config/doom /Users/nick/.config
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```

Zsh Completions

Installed to: /opt/homebrew/share/zsh/site-functions

4. For android studio

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
