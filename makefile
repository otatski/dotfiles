.PHONY: all delete

OLD_NVIM_CONFIG = ~/.config/nvim
OLD_NVIM_CONFIG_BACKUP = ~/.config/nvim.bak

OLD_NVIM_SITE = ~/.local/share/nvim/site
OLD_NVIM_SITE_BACKUP = ~/.local/share/nvim/site.bak

nvim-present:
	@echo "Nvim config found"
	@echo "Backing up current config to ~/.config/nvim.bak"
	@mv ~/.config/nvim ~/.config/nvim.bak

nvim-absent:
	@echo "No Nvim Site config found ... Skipping"

site-present:
	@echo "Nvim Site config found"
	@echo "Backing up current config to ~/.local/share/nvim/site.bak"	
	@mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak
site-absent:

all:
	test -d $(OLD_NVIM_CONFIG) && nvim-present


	# Clone AstroNvim
	@echo "Cloning AstroNvim and placing it in ~/dotfiles/nvim/.config/nvim"
	@git clone https://github.com/AstroNvim/AstroNvim.git ~/dotfiles/nvim/.config/nvim
	# Begin Stowing
	@echo "Stowing dotfiles"
	@stow --verbose --target=$$HOME --restow */
	# Copy user config
	@echo "Copying user config files for nvim"
	@cp -r ~/dotfiles/.nvim_config/user ~/dotfiles/nvim/.config/nvim/lua/
	# Setting up plugins with Packer
	@echo "Run 'Updating Packer' to sync your packer config"
	@nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

delete:
	stow --verbose --target=$$HOME --delete */
