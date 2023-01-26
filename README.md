# Dotfiles

> These are the dotfiles that I use for my system, **Pop!\_OS** **_22.04_** **LTS**. Keep that in mind when trying to use any of the commands used in this Readme. These have not been tested on any other environments.

## Table of Centents:

- [NeoVim](#NeoVim)

- Kitty

- ZSH

- Oh My ZSH

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

#### Astrovim

##### Prerequisites

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
  - See [Fonts](#Fonts) above.
- Neovim 0.8 (Not including nightly)
- Tree-sitter CLI (Note: This is only necessary if you want to use auto_install feature with Treesitter)
- A clipboard tool is necessary for the integration with the system clipboard (see :help clipboard-tool for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)
- Optional Requirements:
  - ripgrep - live grep telescope search (<leader>fw)
  - lazygit - git ui toggle terminal (<leader>tl or <leader>gg)
  - go DiskUsage() - disk usage toggle terminal (<leader>tu)
  - bottom - process viewer toggle terminal (<leader>tt)
  - Python - python repl toggle terminal (<leader>tp)
  - Node - node repl toggle terminal (<leader>tn)
