#!/usr/bin/env bash

create_files_links() {
    echo -e "\n\n Now let set up this"
    read -p 'Do you want to install some apps? y/n' -r ANSWER
    echo -e "$ANSWER"
    if [ "$ANSWER" = "y" ]; then
        sudo apt-get update
        sudo apt install zsh -y
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        
        # add nvm
        git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
        source ~/.zsh-nvm/zsh-nvm.plugin.zsh
        
        # add zsh autosuggestions
        git clone https://github.com/zsh-users/zsh-autosuggestions 
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

        cd
        rm -rf .zshrc
        rm -rf .gitconfig
        cd .dotfiles
        ln -s .dotfiles/.zshrc ~/.zshrc
        ln -s .dotfiles/.gitconfig ~/.gitconfig
        cd
        source .zshrc
        source .gitconfig
        
        sudo apt install android-sdk

        mkdir development
        cd development
        git clone git@github.com:Vinicius-de-Morais/reactNative


        goodbye

    elif [ "$ANSWER" = "n" ]; then
        echo -e "Ok, goodbye"
        exit 1
    else
        echo -e "something wrong"
    fi
}
create_files_links
