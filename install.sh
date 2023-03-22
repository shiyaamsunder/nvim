#!/usr/bin/env bash


echo "Installing ripgrep"
sudo apt-get install ripgrep wget

echo "export FZF_DEFAULT_COMMAND='rg --files'" >> ~/.bashrc 

echo "Installing nvm"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash


exec bash
echo "Type source ~.bashrc and install node using nvm install --lts"


