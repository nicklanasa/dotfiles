# Install

```sh
xargs brew install --cask < casks
xargs brew install < leaves
```

```sh
zsh completions have been installed to:
  /opt/homebrew/share/zsh/site-functions
==> libtool
All commands have been installed with the prefix "g".
If you need to use these commands with their normal names, you
can add a "gnubin" directory to your PATH from your bashrc like:
  PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"
==> openvpn
To start openvpn now and restart at startup:
  sudo brew services start openvpn
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/openvpn/sbin/openvpn --config /opt/homebrew/etc/openvpn/openvpn.conf
==> postgresql@14
This formula has created a default database cluster with:
  initdb --locale=en_US.UTF-8 -E UTF-8 /opt/homebrew/var/postgresql@14

To start postgresql@14 now and restart at login:
  brew services start postgresql@14
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14
==> tmux
Example configuration has been installed to:
  /opt/homebrew/opt/tmux/share/tmux
```

# Ruby

```sh
brew install chruby ruby-install

Add the following to the ~/.bash_profile or ~/.zshrc file:
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

To enable auto-switching of Rubies specified by .ruby-version files,
add the following to ~/.bash_profile or ~/.zshrc:
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh

ruby-install ruby 3.4.1

echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.4.1" >> ~/.zshrc # run 'chruby' to see actual version

gem install jekyll
```
