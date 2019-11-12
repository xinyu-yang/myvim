# myvim
## 源代码安装vim
```shell
vim --version

sudo apt-get remove --purge vim vim-tiny vim vim-runtime gvim vim-common vim-gui-common vim-nox

sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev 

git clone git@github.com:vim/vim.git
cd vim/
./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --with-python-config-dir=/usr/lib/python2.7/config \
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.5/config \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
	   --prefix=/usr/local
make
make install
```

## 首先将配置clone下来
```shell
cd ~
git clone [this repository] .vim
```
## 然后将配置文档./.vimrc链接到~/.vimrc
```shell
ln -s ~/.vim/.vimrc ~/.vimrc
cd .vim
git submodule init ./bundle/Vundle.vim
git submodule update ./bundle/Vundle.vim
:PluginInstall
```
