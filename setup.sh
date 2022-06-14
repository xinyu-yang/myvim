#/bin/bash

# Install ripgrep
inst_rg_root(){
    print_info "Installing ripgrep..."
    sudo apt install ripgrep
}

# Install ctags
inst_ctags_root(){
    print_info "Installing ctags..."
    sudo apt install \
        gcc make \
        pkg-config autoconf automake \
        python3-docutils \
        libseccomp-dev \
        libjansson-dev \
        libyaml-dev \
        libxml2-dev

    git clone https://github.com/universal-ctags/ctags.git
    cd ctags
    ./autogen.sh
    ./configure --prefix=/usr/local # defaults to /usr/local
    make
    sudo make install # may require extra privileges depending on where to install
    cd -
    rm -rf ctags
}

inst_ctags_noroot(){
    print_info "Installing ctags..."
    git clone https://github.com/universal-ctags/ctags.git
    cd ctags
    ./autogen.sh
    ./configure --prefix=$(echo ~)/.local # defaults to /usr/local
    make
    sudo make install # may require extra privileges depending on where to install
    cd -
    rm -rf ctags
}


# Install lf
inst_lf_root(){
    print_info "Installing lf..."
    url=$(curl -Ls -w %{url_effective} -o /dev/null https://github.com/gokcehan/lf/releases/latest)
    wget ${url/tag/download}/lf-linux-amd64.tar.gz -O lf.tar.gz -nv > /dev/null
    if $(file lf.tar.gz | grep gzip > /dev/null);
    then
        mkdir lfexport
        tar zxf lf.tar.gz -C lfexport
        if [ $IS_SUDOER -eq 1 ];
        then
            sudo mv ./lfexport/lf /usr/local/bin/
        else
            mv ./lfexport/lf ~/.local/bin/
        fi
        echo "lf installed."
    fi
    rm lf.tar.gz
    rm -rf ./lfexport
}

inst_lf_noroot(){
    inst_lf_root
}

# Install node.js
inst_node_root(){
    print_info "Installing nodejs..."
    curl -sL install-node.vercel.app/lts | sudo bash -s -- --prefix=/usr/local
}

inst_node_noroot(){
    print_info "Installing nodejs..."
    curl -sL install-node.vercel.app/lts | bash -s -- --prefix=$(echo ~)/.local
}

print_info(){
    echo "==========================================="
    echo >>>>>>>>>>>>> $1
    echo "==========================================="
}

# Test whether this user has sudo priviledge
if sudo -v > /dev/null;
then
    print_info "Install as root"
    IS_SUDOER=1
    POSTFIX=root
    if ! command -v curl > /dev/null;
    then
        print_info "Installing curl"
        sudo apt install curl
    fi
    array=(ctags lf rg node)
else
    print_info "Install as non-root"
    IS_SUDOER=0
    POSTFIX=noroot
    if ! command -v curl > /dev/null;
    then
        echo "No curl command!"
        echo "Exiting..."
        exit 1
    fi
    array=(lf node ctags)
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
