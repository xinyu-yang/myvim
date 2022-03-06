#/bin/bash

# Install ripgrep
inst_rg(){
    echo "Installing ripgrep..."
    sudo apt install ripgrep
} 

# Install ctags
inst_ctags(){
    echo "Installing ctags..."
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

# Install lf
inst_lf(){
    echo "Installing lf..."
    url=$(curl -Ls -w %{url_effective} -o /dev/null https://github.com/gokcehan/lf/releases/latest)
    wget ${url/tag/download}/lf-linux-amd64.tar.gz -O lf.tar.gz -nv > /dev/null
    if $(file lf.tar.gz | grep gzip > /dev/null);
    then
        tar zxf lf.tar.gz
        sudo mv lf /usr/local/bin/
        echo "lf installed."
    fi
}

# Install node.js
inst_node(){
    echo "Installing nodejs..."
    curl -sL install-node.vercel.app/lts | sudo bash -s -- --prefix=/usr/local/
}


# Install prerequirements
array=(ctags lf rg node)
sudo apt install curl
for app in ${array[*]}
do
    if command -v ${app} > /dev/null 2>&1;
    then
        echo "${app} exists"
    else
        inst_${app}
    fi
done
