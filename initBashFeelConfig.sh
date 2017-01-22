#!/bin/bash

#Does .bashrc exist?
bashRc_exist=false

function backupBashRc(){
    cp ~/.bashrc ~/.bashrc_backup
}

function insertInBashRcEOF() {
    printf "\n# Look and Feel
# You may want to put all your additions into ~/.bash_feel
# for putting your own look and feel.

if [ -f ~/.bash_feel ]; then
. ~/.bash_feel
fi\n\n" >> ~/.bashrc
}

if [ -f ~/.bashrc ]; then
    printf "There is an existing \".bashrc\" file on your computer. \nThe existing \".bashrc\" will be saved as \".bashrc_backup\". \nDo you wish to overwrite \".bashrc\" on your computer? "
    bashRc_exist=true;
else
    printf "There is no \".bashrc\" file on your computer. \nDo you wish to continue with the installation? "
    bashRc_exist=false;
fi

#echo $bashRc_exist

while true; do
    read -p "[Yy][Nn] " yn
    case $yn in
        [Yy]* )
            backupBashRc;
            insertInBashRcEOF;
            cp .bash_feel ~/
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer with Y/y or N/n.";;
    esac
done
