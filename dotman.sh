#!/usr/bin/env bash


init_check(){
    #It checks if it's the first time use
    echo -e "\n\nHello, it`s your first time here let`s set up"
    echo -e "Using Vinicius-de-Morais dotfiles repository"
    DOT_REPO="https://github.com/Vinicius-de-Morais/dotfiles.git"

    read -p "Where i should clone $(basename "${DOT_REPO}") (${HOME}/..):" -r DOT_DEST
    DOT_DEST=${DOT_DEST:-$HOME}

    if [[ -d "$HOME/$DOT_DEST" ]]; then
        #initial setup
        if git -C "${HOME}/${DOT_DEST}" clone "${DOT_REPO}"; then
            add_env "$DOT_REPO" "$DOT_DEST"
            echo -e "\ndotman successfully configured"
            goodbye
        else
            echo -e "\n$DOT_REPO Unavailable. Exiting"
			exit 1
        fi
    else
        #repo_check
        echo -e "\n$DOT_DEST Not a Valid directory"
		exit 1
        #manage

    fi
}
init_check