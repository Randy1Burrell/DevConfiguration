# DevConfiguration
This repo contains my dot files for personal confignuration on vi, tmux and zsh. 

## Usage
 ### VI

 Make sure vim is installed on Unix based system. Clone this repository from the command line:

 `git clone <Repo URL here>`

 Navigate to the repo's folder using the following command:

 `cd DevConfiguration`

 Copy the the file configs/vim/vimrc to .vimrc in your home folder:

 `cp configs/vim/vimrc ~/.vimrc`

Install vim [vundle](https://github.com/VundleVim/Vundle.vim) and [pathogen](https://github.com/tpope/vim-pathogen) by following their respective installation guide.

Then install vim plugins by running the following command:

`vim -c 'PluginInstall'`

#### VI Plugin Usage
Make a plugins directory in ~/.vim directory by running the following command:

`mkdir -p ~/.vim/plugin`

Copy files from configs/vim/plugins to ~/.vim/plugin/, the command is as follows:

`cp configs/vim/plugin/* ~/.vim/plugin`

### ZSH
Make sure zsh is currently the default shell then run the following command:

`cp configs/zsh/zshrc ~/.zshrc

> That's it!

### Tmux

Make sure tmux is installed and run the following command:
`cp configs/tmux/tmux.conf ~/.tmux.conf`

> That's all folks

