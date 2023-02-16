# myvim

![screenshot](https://i.loli.net/2021/11/22/wNt5PvpkadhErHq.png)


## Automatic Setup

> Good Luck!

```shell
git clone [this repository] ~/.vim
cd ~/.vim/

./setup.sh
```



## Manual Setup

### Remove old vim
```shell
vim --version

sudo apt-get remove --purge vim vim-tiny vim-runtime gvim vim-common vim-gui-common vim-nox
```

### Install prerequisite libraries
* REF: [https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source](https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source)
```shell
sudo apt install libncurses5-dev libgtk2.0-dev libatk1.0-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev \
ruby-dev lua5.2 liblua5.2-dev libperl-dev liblzma-dev git
```

* Also python3 should be installed with proper [prerequisites and configurations](https://stackoverflow.com/questions/8097161/how-would-i-build-python-myself-from-source-code-on-ubuntu), some of them (e.g., `./confugure --enabled-shared`, `sudo apt install libbz2-dev`) are necessory. Some of them may incur error when compiling vim (e.g., `./configure --enable-pydebug`).

> Note: Uninstall source compiled python is a nasty work:
>
> rm python3.x in /usr/local/bin/
>
> rm python3.x in /usr/local/lib/python3.x
**But do not remove /usr/local/lib/libpython3.x.so before you make sure!**

### Clone vim source code and compile
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
            --with-python3-config-dir=$(python3-config --configdir)
make
make install
```



## There are some alternative operations
Most of them have been coved in `setup.sh`. Currently, root priviledge is required to run this script.

### Coc.nvim requirments
[Coc.nvim](https://github.com/neoclide/coc.nvim) has a requirement:
* `node.js version >= 16`

### Tagbar requirements
[Ctags](https://ctags.io/) should be installed before tagbar, as shown in area B can work. In addition, ctags is responsible for tag files, without which **jump** function in C/C++ can't work.
- [ ] A script should be made to generate tag files with default configuration.

### CtrlSF plugin dependencies
[CtrlSF](https://github.com/dyng/ctrlsf.vim) is plugin which provide handy and powerful search function in big project. Its search ability is powered by tools like `ack`,`ag`,`pt` and `rg`, which are similar to famous `grep`, but faster and more powerful than it.

Here we apply [rg](https://github.com/BurntSushi/ripgrep) as our search tool, which is claimed as the fastest search tool and is actively maintained.
So we should install `rg` before ctrlSF can work, the install process can be obtained in ctrlSF site linked above.

### Powerline supported fonts
A suitable font should be installed before `airline` well display. There are many choice:
* Cascadia Mono PL: https://github.com/microsoft/cascadia-code
* Fira Code: https://github.com/tonsky/FiraCode (I donot like ligature font)
* nerd-fonts: https://github.com/ryanoasis/nerd-fonts

nerd-fonts supports patch fonts (e.g., Dejavu Sans Mono) yourself, that sounds interesting. As far as I know, Dejavu Sans Mono supports more symbols than Fira Code (An very popular ligature font) and Cascadia Mono (Windows Terminal default font).

### lf usage
[lf](https://github.com/gokcehan/lf) is used to browse files, it can be integrated into vim by a simple vim script.


### coc.nvim
[coc.nvim](https://github.com/neoclide/coc.nvim) may not work before we install language plugins.
Take the python3 as an example:
```
vim
:CocInstall coc-pyright
```
A more convenient approach is execute `:CocList` in vim and select `marketplace`.
Then you can search and select the plugin to install.
The details can be obtained in official site linked above.
