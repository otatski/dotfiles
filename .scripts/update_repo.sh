#!/usr/bin/env bash

RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

matstrovim=$HOME/dotfiles/.nvim_config/user
astrovim=$HOME/dotfiles/nvim/.config/nvim/lua/user

if [ $astrovim -ot $matstrovim ]; then
    echo "You are about to replace a newer version with an older version.";
    echo "Are you sure? [y/N]";
    read response
    if [ $response == 'y' ] || [ $response == 'Y' ]; then
        rm -rf $matstrovim;
        cp -r $astrovim $matstrovim;
        echo -e "${RED}deleted:${NC} $matstrovim";
        echo -e "${GREEN}replaced with:${NC} $astrovim";
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
    echo -e "${RED}deleted:${NC} $matstrovim";         
    echo -e "${GREEN}replaced with:${NC} $astrovim";
    exit 0;
else
    echo "Nothing to update ...";
    exit 0;
fi
