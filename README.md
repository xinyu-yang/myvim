# myvim
## Remove old vim
```shell
vim --version

sudo apt-get remove --purge vim vim-tiny vim-runtime gvim vim-common vim-gui-common vim-nox
```

## Install prerequisite libraries
* REF: [https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source](https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source)
```shell
sudo apt install libncurses5-dev libgtk2.0-dev libatk1.0-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev \
ruby-dev lua5.2 liblua5.2-dev libperl-dev git
```
* Also python3 should be installed with proper [prerequisites and configurations](https://stackoverflow.com/questions/8097161/how-would-i-build-python-myself-from-source-code-on-ubuntu), some of them (e.g., --enabled-shared, libbz2-dev) are necessory. So if YCM compile fail, we have to reinstall python3.

## Clone and compile
```shell
git clone https://github.com/vim/vim.git
cd vim/
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/local/python3.8/config
make
make install
```

## clone this repository first.
```shell
cd ~
git clone [this repository] .vim
```
## then link ~/.vimrc
```shell
ln -s ~/.vim/.vimrc ~/.vimrc
cd .vim
git submodule init ./bundle/Vundle.vim
git submodule update ./bundle/Vundle.vim

:PluginInstall
```
## There are some operates should be performed before work.
### YouCompleteMe compiled require
YCM has some requirements:
* GCC version >= 8
* VIM version >= v8.1.2269
* Python3 version > 3.5

For details, refer to YCM reporsitory.

[YCM](https://github.com/ycm-core/YouCompleteMe) may not work before we compile it mannually.
The basic instruction is:
```
cd ./bundle/YouCompleteMe/
./install.py --clangd-completer
```
The details can ne obtained in official site linked above.
### CtrlSF plugin dependency
[CtrlSF](https://github.com/dyng/ctrlsf.vim) is plugin which provide handy and powerful search function in big project. Its search ability is powered by tools like `ack`,`ag`,`pt` and `rg`, which are similar to famous `grep`, but faster and more powerful than it.

Here we apply [rg](https://github.com/BurntSushi/ripgrep) as our search tool, which is claimed as the fastest search tool and is actively maintained.
So we should install `rg` before ctrlSF can work, the install process can be obtained in ctrlSF site linked above.

### Powerline supported fonts.
A suitable font should be installed before `airline` well display. There are many choice:
* Cascadia Mono PL: https://github.com/microsoft/cascadia-code
* Fira Code: https://github.com/tonsky/FiraCode (I donot like ligature font)
* nerd-fonts: https://github.com/ryanoasis/nerd-fonts

nerd-fonts supports patch fonts (e.g., Dejavu Sans Mono) yourself, that sounds interesting. As far as I know, Dejavu Sans Mono supports more symbols than Fira Code (An very popular ligature font) and Cascadia Mono (Windows Terminal default font).
