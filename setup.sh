#!/bin/bash

REQ_VIM_V=8.1.1719

# Define some ultity functions
# Compare version
function version_le() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" == "$1"; }

# print_* functions
print_info(){ echo -e "[INFO]" "$1"; }
print_warn(){ echo -e "[WARNING]" "$1"; }
print_error(){ echo -e "[ERROR]" "$1"; }

# Purge old vim
rm_old_vim_root() {
	print_info "Removing old version vim."
	sudo apt-get remove -y --purge vim vim-tiny vim-runtime gvim vim-common vim-gui-common vim-nox
}


###################################
# Install vim
###################################
inst_vim_root() {
	print_info "Installing new version vim to /usr/local ..."

	# Install prerequirements
	sudo apt update
	sudo apt install -y libncurses5-dev libgtk2.0-dev libatk1.0-dev \
		libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev \
		ruby-dev lua5.2 liblua5.2-dev libperl-dev liblzma-dev git

	# Download and install vim
	wget https://github.com/vim/vim/archive/refs/tags/v9.0.1600.tar.gz -O /tmp/vim9.0.tar.gz
    if $(file /tmp/vim9.0.tar.gz | grep gzip > /dev/null);
    then
        mkdir /tmp/vim_src
        tar zxf /tmp/vim9.0.tar.gz -C /tmp/vim_src
	else
		print_error "Vim download fails!"
		exit 1
    fi

	sleep 1
	cd /tmp/vim_src

	./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local/ \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir)
	make -j 4
	sudo make install

	rm -rf /tmp/vim_src
}


# Unfortunatelly, it is almost impossible to install vim without root priviledge.
inst_vim_noroot() {
	print_info "Installing new version vim to ~/.local/bin"

	# Download and install vim
	wget https://github.com/vim/vim/archive/refs/tags/v9.0.1600.tar.gz -O /tmp/vim9.0.tar.gz
    if $(file /tmp/vim9.0.tar.gz | grep gzip > /dev/null);
    then
        mkdir /tmp/vim_src
        tar zxf /tmp/vim9.0.tar.gz -C /tmp/vim_src
	else
		print_error "Vim download fails!"
		exit 1
    fi

	sleep 1
	cd /tmp/vim_src

	./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=~/.local/ \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir)
	make -j 4
	make install

	rm -rf /tmp/vim_src
}


###################################
# Install ripgrep
###################################
inst_rg_root(){
    print_info "Installing ripgrep..."
    #sudo apt install -y ripgrep
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
	sudo dpkg -i ripgrep_13.0.0_amd64.deb
	rm ripgrep_13.0.0_amd64.deb
}


###################################
# Install ctags
###################################
inst_ctags_root(){
    print_info "Installing ctags..."
    sudo apt install -y \
        gcc make \
        pkg-config autoconf automake \
        python3-docutils \
        libseccomp-dev \
        libjansson-dev \
        libyaml-dev \
        libxml2-dev

    git clone https://github.com/universal-ctags/ctags.git /tmp/ctags_src
	sleep 1
    cd /tmp/ctags_src
    ./autogen.sh
    ./configure --prefix=/usr/local # defaults to /usr/local
    make -j 4
    sudo make install # may require extra privileges depending on where to install
    cd -
    rm -rf /tmp/ctags_src
}

inst_ctags_noroot(){
    print_info "Installing ctags..."
    git clone https://github.com/universal-ctags/ctags.git /tmp/ctags_src
	sleep 1
    cd /tmp/ctags_src
    ./autogen.sh
    ./configure --prefix=$(echo ~)/.local # defaults to /usr/local
    make -j 4
    make install # may require extra privileges depending on where to install
    cd -
    rm -rf /tmp/ctags_src
}


###################################
# Install lf
###################################
inst_lf_root(){
    print_info "Installing lf..."
    url=$(curl -Ls -w %{url_effective} -o /dev/null https://github.com/gokcehan/lf/releases/latest)
    wget ${url/tag/download}/lf-linux-amd64.tar.gz -O /tmp/lf.tar.gz -nv > /dev/null
    if $(file /tmp/lf.tar.gz | grep gzip > /dev/null);
    then
        mkdir /tmp/lfexport
        tar zxf /tmp/lf.tar.gz -C /tmp/lfexport
        if [ $IS_SUDOER -eq 1 ];
        then
            sudo mv /tmp/lfexport/lf /usr/local/bin/
        else
            mv /tmp/lfexport/lf ~/.local/bin/
        fi
        print_info "lf installed."
    fi
    rm /tmp/lf.tar.gz
    rm -rf /tmp/lfexport
}

inst_lf_noroot(){
    inst_lf_root
}


###################################
# Install node.js
# Don't install too new node version, v16.0 is ok.
###################################
inst_node_root(){
    print_info "Installing nodejs..."
    curl -sL install-node.vercel.app/v16.0 | sudo bash -s -- -y --prefix=/usr/local
}

inst_node_noroot(){
    print_info "Installing nodejs..."
	local prefix=$(echo ~)/.local
	if [ ! -d $prefix ]; then
		mkdir $prefix
	fi
    curl -sL install-node.vercel.app/v16.0 | bash -s -- -y --prefix=$(echo ~)/.local
}


# Test whether the vim version meets requirements.
VIM_V=$(vim --version | head -n 1 | cut -d " " -f 5)
if (version_le $VIM_V $REQ_VIM_V); then
	if (sudo -v > /dev/null); then
		rm_old_vim_root
		inst_vim_root
		print_info "vim installed successfully!"
	else
		inst_vim_noroot
		#print_info "Do not have required vim version!"
		#exit 1
		print_info "vim installed successfully!"
	fi
fi


# Test whether this user has sudo priviledge
if (sudo -v > /dev/null);
then
    array=(ctags lf rg node)
    print_info "Installing ${array[*]} as root"
    IS_SUDOER=1
    POSTFIX=root
    if ! command -v curl > /dev/null;
    then
        print_info "Installing curl"
        sudo apt install -y curl
    fi
else
    array=(lf node ctags)
    print_info "Installing ${array[*]} as non-root"
    IS_SUDOER=0
    POSTFIX=noroot
    if ! command -v curl > /dev/null;
    then
        print_error "No curl command!"
        print_error "Exiting..."
        exit 1
    fi
fi


# Install prerequirements
for app in ${array[*]}
do
    if command -v ${app} > /dev/null 2>&1;
    then
        print_info "${app} exists"
    else
        inst_${app}_${POSTFIX}
    fi
done


# Add vim config
if [ ! -f $HOME/.vimrc ]; then
	print_info "Linking vim config..."
	ln -s ~/.vim/.vimrc ~/.vimrc
	print_info "Installing plugins..."
	vim -E -s -u "~/.vimrc" -c "PlugInstall" -c "qall"
fi
