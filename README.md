# Dotfiles

> These are the dotfiles that I use for my system, **Pop!\_OS** **_22.04_** **LTS**. Keep that in mind when trying to use any of the commands used in this Readme. These have not been tested on any other environments.

## Table of Contents:

- [Dotfiles](#Dotfiles)

- [NeoVim](#NeoVim)

- Kitty

- ZSH

- Oh My ZSH

---

---

## Dotfiles

Follow these steps get the dotfiles:

1. Navigate to your home directory
2. Run:
   - `git clone git@github.com:otatski/dotfiles.git`
3. Remove any files or folders you don't wish to use. For example:
   - If you just want the AstroNvim configuration then delete everything but `.nvim_config`, `makefile`, and `README.md`.

---

---

## NeoVim

#### Prerequisites

##### NeoVim Prerequisites

##### Debian

```
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
```

> If you have the corresponding command(s) for another distribution or OS then submit an issue and I'll include it.

---

##### NeoVim Installation

###### Linux (x64)

> These instructions are a little more in depth since I am more familiar with them.

**Tarball**

1. Download [nvim-linux64.tar.gz](https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz)
2. Extract: `tar xzvf nvim-linux64.tar.gz`
3. Run `./nvim-linux64/bin/nvim`

**Debian Package**

1. Download [nvim-linux64.deb](https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb)
2. Navigate to the download location or use its full path
3. Install the package using:
   - `sudo apt install ./nvim-linux64.deb`<br>
     If that doesn't work. Install directly with `dpkg`
   - `sudo dpkg -i ./nvim-linux64.deb`
4. Run `nvim`

**AppImage**

1. Download [nvim.appimage](https://github.com/neovim/neovim/releases/download/v0.8.0/nvim.appimage)
2. Run `chmod u+x nvim.appimage && ./nvim.appimage`
   - If your system does not have FUSE you can [extract the appimage](https://github.com/AppImage/AppImageKit/wiki/FUSE#type-2-appimage):
   ```bash
   ./nvim.appimage --appimage-extract
   ./squashfs-root/usr/bin/nvim
   ```

**Other**

- Install by [package manager](https://github.com/neovim/neovim/wiki/Installing-Neovim)

---

###### macOS

1. Download [nvim-macos.tar.gz](https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-macos.tar.gz)
2. Run `xattr -c ./nvim-macos.tar.gz (to avoid "unknown developer" warning)`
3. Extract: `tar xzvf nvim-macos.tar.gz`
4. Run `./nvim-macos/bin/nvim`

---

###### Windows

**Zip**

1. Download [nvim-win64.zip](https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-win64.zip)
2. Extract the zip.
3. Run `nvim-qt.exe`

**MSI**

1. Download [nvim-win64.msi](https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-win64.msi)
2. Run the MSI
3. Search and run `nvim-qt.exe` or run `nvim.exe` on your CLI of choice.

---

---

#### Fonts

##### Nerd Fonts - Fonts that support icons

I recommend using `getnf` to get a front from [Nerd Fonts](https://www.nerdfonts.com/font-downloads).

##### Nerd Font Prerequisites

```bash
sudo apt-get install curl unzip fzf fontconfig
```

##### getnf Installation

```bash
git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh
```

##### getnf Usage

1. Run from the terminal
   - `getnf`<br>

It will represent you with a list of NerdFonts with fzf, select the ones you want, and let it do it's work.

By default the downloaded archives are removed, But if you give getnf the `-k` flag, it will not remove the Archives from the download directory

---

---

#### AstroNvim

##### Prerequisites

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
  - See [Fonts](#Fonts) above.
- [Neovim 0.8 (Not including nightly)](https://github.com/neovim/neovim/releases/tag/v0.8.0)
  - See [NeoVim](#NeoVim) above.
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md) (Note: This is only necessary if you want to use auto_install feature with Treesitter)
- A clipboard tool is necessary for the integration with the system clipboard (see [:help clipboard-tool](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)
  - See [Kitty](#Kitty) below.
- Optional Requirements:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>fw`)
    - `sudo apt install ripgrep`
  - [lazygit](https://github.com/jesseduffield/lazygit) - git ui toggle terminal (`<leader>tl` or `<leader>gg`)
    - Debian/Ubuntu
      ```bash
         LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
         curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
         tar xf lazygit.tar.gz lazygit
         sudo install lazygit /usr/local/bin
      ```
  - [go DiskUsage()](https://github.com/dundee/gdu) - disk usage toggle terminal (`<leader>tu`)
  - [bottom](https://github.com/ClementTsang/bottom) - process viewer toggle terminal (`<leader>tt`)
  - [Python](https://www.python.org/) - python repl toggle terminal (`<leader>tp`)
    - NeoVim Python Support
      - `pip install pynvim`
  - [Node](https://nodejs.org/en/) - node repl toggle terminal (`<leader>tn`)
    - NeoVim Node Support
      - npm i -g neovim

> **INFO:** When using default theme: For MacOS, the default terminal does not have true color support. You will need to use [iTerm2](https://iterm2.com/) or [another terminal emulator](https://gist.github.com/XVilka/8346728#terminal-emulators) that has true color support.

---

---

##### Installation

###### Linux/Mac OS (Unix)

1. Make a backup of your current nvim folder
   - `mv ~/.config/nvim ~/.config/nvim.bak`
2. Clean neovim folders (Optional but recommended)
   - ```bash
     mv ~/.local/share/nvim ~/.local/share/nvim.bak
     mv ~/.local/state/nvim ~/.local/state/nvim.bak
     mv ~/.cache/nvim ~/.cache/nvim.bak
     ```
3. Clone the repository

   - ```bash
     git clone https://github.com/AstroNvim/AstroNvim ~/dotfiles/nvim/.config/nvim
     nvim
     ```

---

###### Windows (PowerShell)

1. Make a backup of your current nvim folder

   - `Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak`

2. Clean old plugins (Optional but recommended)

   - `Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak`

3. Clone the repository

   - ```powershell
       git clone https://github.com/AstroNvim/AstroNvim $env:LOCALAPPDATA\nvim
       nvim
     ```

---

###### Docker

If you want to try AstroNvim before installing you can use the following Docker command to open a test instance without touching your current Neovim configuration. This also allows you to use :TSInstall and :LspInstall to load and evaluate language servers and treesitter parsers as well.

```shell
    docker run -w /root -it --rm alpine:edge sh -uelic '
    apk add bash git lua nodejs npm lazygit bottom python3 go neovim ripgrep alpine-sdk --update
    git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
    # Uncomment the line below and replace the link with your user config repo to load a user config
    # git clone https://github.com/username/AstroNvim_user ~/.config/nvim/lua/user
    nvim --headless -c "autocmd User PackerComplete quitall"
    nvim
    '
```

##### AstroNvim User Config

This will add my updated version of AstroNvim with added plugins and keybinds

1. Navigate to the dotfiles directory
2. Run
   - `make all`
   - This will add a link from `.nvim_config/user` to `nvim/user`. Any edit you make to the configuration should be done in this directory. Please see the [AstroNvim](https://astronvim.github.io/) documentation if you have any questions.
3. Run
   - `nvim +PackerSync`
4. Type `q` to exit the Packer window after everything has been updated.
