#!/bin/bash

#Does .bashrc exist?
bashRc_exist=false;

#User specifies custom file name
useCustomFileName=false;
customFileName=$1;
if [ -z $1 ]; then
    customFileName=".bash_feel";
fi


function backupBashRc(){
    cp ~/.bashrc ~/.bashrc_backup;
}

function doesBashRcExist(){
    if [ -f ~/.bashrc ]; then
        printf "There is an existing \".bashrc\" file on your computer. \nThe existing \".bashrc\" will be saved as \".bashrc_backup\". \nDo you wish to overwrite \".bashrc\" on your computer? ";
        bashRc_exist=true;
    else
        printf "There is no \".bashrc\" file on your computer. \nDo you wish to continue with the installation? ";
        bashRc_exist=false;
    fi
}

function doesBashFeelExist(){
    if [ -f ~/.bash_feel ]; then
        printf "There is an existing \".bash_feel\" file on your computer. \nWe will need you to give a custom name for the configuration file. \n";
        while true; do
            read -p "What will you like that name to be? " customFileName
            if [ -f ~/$customFileName ]; then
                printf "There is already an existing \"%s\" file on your computer. \n" $customFileName;
            else
                useCustomFileName=true;
                break;
            fi
        done
    fi
}

function insertInBashRcEOF() {
    printf "\n# Look and Feel
# You may want to put all your additions into ~/%s
# for putting your own look and feel.

if [ -f ~/%s ]; then
  . ~/%s
fi\n\n" $customFileName $customFileName $customFileName >> ~/.bashrc;
}

echo "This script is used to install your configuration file";
doesBashFeelExist;
echo "Configutaion file set!"
doesBashRcExist;
while true; do
    read -p "[Yy][Nn] " yn;
    case $yn in
        [Yy]* )
            # "Look and Feel" Configuration File
            if $useCustomFileName; then
                printf "Creating \"%s\" configuration file... \n" $customFileName;
                cp .bash_feel ~/$customFileName;
            else
                echo "Creating .bash_feel configuration file..."
                cp .bash_feel ~/
            fi

            if $bashRc_exist; then
                echo "Backing up .bashrc to .bashrc_backup...";
                echo "Updating .bashrc...";
                backupBashRc;
            else
                echo "Creating new .bashrc file...";
                touch ~/.bashrc;
            fi;
            insertInBashRcEOF;

            echo "Done!"
            break;;
        [Nn]* )
            echo "Cancelling installation..."
            exit;;
        * )
            echo "Please answer with Y/y or N/n.";;
    esac
done
