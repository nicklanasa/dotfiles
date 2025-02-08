# Setup 

1. link `.zshrc` from home dir `ln -s dotfiles/.zshrc .zshrc`
2. link tmux config from home dir `ln -s dotfiles/.tmux.conf .tmux.conf`
3. Install emacs (after install WSL with `wsl --install` from powershell)

``` sh
git clone git://git.sv.gnu.org/emacs.git
sudo apt-get install "fonts-cascadia-code"
sudo apt install build-essential libgtk-3-dev libgnutls28-dev libtiff5-dev libgif-dev libjpeg-dev libpng-dev libxpm-dev libncurses-dev texinfo libjansson4 libjansson-dev libgccjit0 libgccjit-10-dev gcc-10 g++-10 gnome-tweaks
export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
cd emacs
./autogen.sh
./configure --with-native-compilation --with-x-toolkit=gtk3
make -j8
sudo make install
```

Then quit and restart terminal

Install will be install at `/usr/local/bin/emacs`
4. Install `doom emacs`
5. Install x410 and enable public access/wsl

# Launching emacs

Open up windows terminal and run:

``` sh
emacs &
```

# Author 

Nickolas Lanasa
