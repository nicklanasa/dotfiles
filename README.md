# Nick Lanasa's Dotfiles

## Install

```sh
npm install -g typescript typescript-language-server
xargs brew install --cask < casks
xargs brew install < leaves
```

## Fonts

Copy the Mononoki fonts to your system font directory:

```sh
cp -r Mononoki/*.ttf ~/Library/Fonts/
```

## Terminal Themes

Import the NyPro Light theme in macOS Terminal:
1. Open Terminal > Settings (or press Command+,)
2. Click the gear icon at the bottom left
3. Click "Import..."
4. Select `NyPro Light.terminal`

## Tmux

The repository includes a `.tmux.conf` configuration for terminal multiplexing.

Copy to your home directory:

```sh
cp .tmux.conf ~/.tmux.conf
```

## Backup

Export current brew packages:

```sh
brew leaves > leaves
brew casks > casks
```
