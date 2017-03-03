#!/bin/bash

#   To install copy next line
#   curl https://raw.githubusercontent.com/CostaRico/bash-helper/master/installer.bash | bash

curl -o ~/.bash_helper https://raw.githubusercontent.com/CostaRico/bash-helper/master/.bashrc
cat ~/.bash_helper >> ~/.bashrc
source ~/.bashrc
