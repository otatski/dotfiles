#!/usr/bin/env bash

matstrovim=$HOME/dotfiles/.nvim_config/user
astrovim=$HOME/dotfiles/nvim/.config/nvim/lua/user

if [ $astrovim -ot $matstrovim ]; then
    echo "You are about to replace a newer version with an older version.";
    echo "Are you sure? [y/N]";
    read response
    if [ $response == 'y' ] || [ $response == 'Y' ]; then
        rm -rf $matstrovim;
        cp -r $astrovim $matstrovim;
        echo "$matstrovim replaced with $astrovim";
        exit 0;    
    elif [ $response == 'n' ] || [ $response == 'N' ]; then
        exit 0;
    else
        echo "Invalid response, exiting ...";
        exit 1;
    fi
elif [ $astrovim -nt $matstrovim ]; then
    rm -rf $matstrovim;
    cp -r $astrovim $matstrovim;
    echo "$matstrovim replaced with $astrovim";
    exit 0;
else
    echo "Nothing to update ...";
    exit 0;
fi

