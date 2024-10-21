# Dotfiles Setup

## 1. Install Homebrew Packages

```sh
xargs brew install < leaves
xargs brew install --cask < casks
```

## 2. Symlink Config Files

```sh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

## 3. Install Emacs with Doom

```sh
brew tap d12frosted/emacs-plus
brew reinstall emacs-plus \
  --with-imagemagick \
  --with-xwidgets \
  --with-mailutils \
  --with-c9rgreen-sonoma-icon
```

## 4. Start Services

### OpenVPN

```sh
sudo brew services start openvpn
# Or run manually:
# /opt/homebrew/opt/openvpn/sbin/openvpn --config /opt/homebrew/etc/openvpn/openvpn.conf
```

### PostgreSQL 14

```sh
brew services start postgresql@14
# Or run manually:
# /opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14
```

### Emacs (optional daemon)

```sh
brew services start emacs
# Or run manually:
# /opt/homebrew/opt/emacs/bin/emacs --fg-daemon
```

### Tmux

A sample config is available at:

```
/opt/homebrew/opt/tmux/share/tmux
```

---

## Notes

### Zsh Completions

Installed to:

```
/opt/homebrew/share/zsh/site-functions
```

### Binutils (Keg-Only)

Add to `.zshrc` if needed:

```sh
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/binutils/lib"
export CPPFLAGS="-I/opt/homebrew/opt/binutils/include"
```

---

## Author

Nickolas Lanasa
