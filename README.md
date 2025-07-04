# Dotfiles Setup

## 1. Install Omarchy and nvidia drivers

```sh
sudo pacman -R nvidia nvidia-utils nvidia-settings lib32-nvidia-utils
sudo pacman -S nvidia-open-dkms
```

For monitor and keyboard brightness, put in `hyprland.conf`

``` sh
# Screen brightness
bind = ,F7,exec,brightnessctl --device=amdgpu_bl2 set 10%-
bind = ,F8,exec,brightnessctl --device=amdgpu_bl2 set +10%

# Keyboard backlight
bind = ,F2,exec,brightnessctl --device='asus::kbd_backlight' set 1-
bind = ,F3,exec,brightnessctl --device='asus::kbd_backlight' set +1

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
