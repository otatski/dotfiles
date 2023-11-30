all:
	stow --verbose --target=$$HOME --restow */
	stow --verbose --target=nvim/.config/nvim/lua --restow .nvim_config 
	# stow --verbose --target=$$HOME --restow xresources
delete:
	stow --verbose --target=$$HOME --delete */
	stow --verbose --target=nvim/.config/nvim/lua --delete user
	# stow --verbose --target=$$HOME --delete xresources
