# Setup 

1. Install homebrew and packages
```
xargs brew install < leaves
Xargs brew install --cask < casks
```
2. Link `.zshrc` from home dir `ln -s dotfiles/.zshrc .zshrc`
3. Link tmux config from home dir `ln -s dotfiles/.tmux.conf .tmux.conf`
4. Install emacs with doom

``` sh
brew tap d12frosted/emacs-plus
brew reinstall emacs-plus --with-native-comp --with-imagemagick --with-xwidgets --with-mailutils --with-c9rgreen-sonoma-icon
```
5. Start services
```
==> openvpn
To start openvpn now and restart at startup:
  sudo brew services start openvpn
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/openvpn/sbin/openvpn --config /opt/homebrew/etc/openvpn/openvpn.conf

==> postgresql@14
This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /opt/homebrew/var/postgresql@14

To start postgresql@14 now and restart at login:
  brew services start postgresql@14
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14

==> tmux
Example configuration has been installed to:
  /opt/homebrew/opt/tmux/share/tmux
```

# Author 

Nickolas Lanasa
