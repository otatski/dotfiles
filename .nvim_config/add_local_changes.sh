#!/usr/bin/env bash

RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

dev=$HOME/dotfiles/.nvim_config/user
production=$HOME/dotfiles/nvim/.config/nvim/lua/user

if [ $production -nt $dev ]; then
    echo "You are about to replace a newer version with an older version.";
    echo "Are you sure? [y/N]";
    read response
    if [ $response == 'y' ] || [ $response == 'Y' ]; then
        rm -rf $production;
        cp -r $dev $production;
        echo -e "${RED}deleted:${NC} $production";
        echo -e "${GREEN}replaced with:${NC} $dev";
        exit 0;
    elif [ $response == 'n' ] || [ $response == 'N' ]; then
        exit 0;
    else
        echo "Invalid response, exiting ...";
        exit 1;
    fi
elif [ $production -ot $dev ]; then
    rm -rf $production;
    cp -r $dev $production;
    echo -e "${RED}deleted${NC}: $production";
    echo -e "${GREEN}replaced with:${NC} $dev";
    exit 0;
else
    echo "Nothing to update ...";
    exit 0;
fi
