# Dotfiles Setup

## 1. Install Omarchy and nvidia drivers

```sh
sudo pacman -R nvidia nvidia-utils nvidia-settings lib32-nvidia-utils
sudo pacman -S nvidia-open-dkms
```

## 2. Symlink Config Files

```sh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

## 3. Install Emacs for wayland

```sh
sudo pacman -S emacs-wayland
```

---

## Author

Nickolas Lanasa
