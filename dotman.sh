#!/usr/bin/env bash

create_files_links(){
    echo -e "\n\n Now let set up this"
    read -p 'Do you want to update apt-get? y/n' -r ANSWER
    echo -e "$ANSWER"
    if [ "$ANSWER" = "y" ]; then
        apt-get update
        cd ~/.dotfiles
        ln -s ~/.dotfiles/.zshrc ~/.zshrc
        ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    else
        echo -e "something wrong"
    fi
}
create_files_links