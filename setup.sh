#!/usr/bin/env bash


for file in $(ls | grep -v README.md setup.sh); do stow file; done

