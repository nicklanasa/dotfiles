# Initial mac setup

- Update to latest Mac OS
- Turn on tap to click for touchpad
- Set display to more space
- Max keyboard repeat and delay
- Remap ctrl to caps lock
- Setup touch id
- Setup Documents in iCloud drive
- Configure date + time, set timezone automatically
- Update login items
- Update spotlight to only search necessary things
- Set show scrollbars when scrolling
- Turn on apple intelligence but disable siri
- Set dock animation to scale, turn off recents and hide it
- Remove everything from dock expect daily apps
- Turn off widgets on desktop
- Turn on night shift and set to maximum warn (sunrise to sunset)
- Turn off spotlight in menu bar
- Update notifications
- Set click wallpaper to `Only in Stage Manager`
- Update lock screen settings, 5 min on batter, 10 min on power
- Setup internet accounts
- Setup wallet and apple pay
- Update computer name is necessary
- Update login items and extensions
- Setup time machine

# Fonts

Unzip and install Mononoki fonts

# Terminal Themes

Import the NyPro Light/Dark theme in macOS Terminal:

1. Open Terminal > Settings (or press Command + ,)
2. Click the gear icon at the bottom left
3. Click "Import..."
4. Select .terminal file

# Install apps

## Install homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Leaves

```shell
cd ~/dotfiles/brew
xargs brew install < leaves
```

## Casks

```shell
cd ~/dotfiles/brew
xargs brew install --cask < casks
```

## Tmux

```shell
ln -s ~/dotfiles/.tmux.conf ~
```

## Xcode

- Install from App Store
- Install Mac OS and iOS
- Install iOS Simulator

## Android studio

Install defaults and setup android virtual simulator

```shell
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

## Visual Studio Code

Connect sync settings to github

## LM Studio

Download local models

1. Qwen3.8 27B (qwen3.8-27b-mlx)
2. Glm 4.7 Flash (zai-org/glm-4.7-flash)

## Tailscale

Setup tailscale with Apple account

## Little Snitch

Install with DMG in iCloud and set license

## Crossover

### SkateXL

```sh
cp -r ~/Documents/Games ~
ln -s Games/SkaterXL ~/Documents 
```

## Backup brew

```shell
brew leaves > leaves
brew casks > casks
```
