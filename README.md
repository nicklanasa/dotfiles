# Setup 

FONT: Jetbrains mono nerd

1. link .config from home dir `ln -s dotfiles/.config .config`

2. link tmux config from home dir `ln -s dotfiles/.tmux.conf .tmux.conf`

3. install deps: emacs, tmux, node, git, ripgrep, coreutils, fd fish, tpm, doom-emacs

```
brew install emacs tmux node git ripgrep coreutils fd fish
xcode-select --install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo npm i -g typescript-language-server; sudo npm i -g typescript
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```

4. Setup fish

append fish shell to: /etc/shells, install fisher, tide, nerd fonts
```
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v5
https://github.com/ryanoasis/nerd-fonts
```

# Author 

Nickolas Lanasa
