# Setup 

1. link .config from home dir `ln -s dotfiles/.config .config`

2. link tmux config from home dir `ln -s dotfiles/.tmux.conf .tmux.conf`

3. install deps: emacs-plus, tmux, node, git, ripgrep, coreutils, fd fish, tpm, doom-emacs

```
xcode-select --install
brew install tmux node git ripgrep coreutils fd fish
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo npm i -g typescript-language-server; sudo npm i -g typescript
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

4. Set fish to $SHELL var in default shell config

```
export SHELL=/opt/homebrew/bin/fish
```

5. Setup fish and fonts

append fish shell to: /etc/shells, install fisher, tide, monaco nerd fonts by double clicking
```
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v5
git clone https://github.com/Karmenzind/monaco-nerd-fonts
```

# Author 

Nickolas Lanasa
