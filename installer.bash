#!/bin/bash

#   To install copy next line
#   curl https://raw.githubusercontent.com/CostaRico/bash-helper/master/installer.bash | bash

curl -o ~/.bash_helper https://raw.githubusercontent.com/CostaRico/bash-helper/master/.bashrc

if grep -q bash_helper ~/.bashrc;
then
        echo "Updating helper..";
else
        echo "Installing helper..";
     echo "
        source ~/.bash_helper" >> ~/.bashrc;
     echo "
        source ~/.bash_helper" >> ~/.bash_profile;
fi;

source ~/.bash_helper
exec bash
