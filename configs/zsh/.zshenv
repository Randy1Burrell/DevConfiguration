export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_WHITE PR_BOLD_BLACK

# Exports {{{

## SET UP GIT
# Who git and github will see me as
export GITHUB_USER="randy1burrell"

# Add PATH for android sdk
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

# Add Golang path
export GOROOT="/usr/local/Cellar/go/1.16.3/libexec/"
export GOPATH="$HOME/Projects/Environments/Go"

# Set up ruby
export GEM_HOME="$HOME/.gem"

# Set up ruby include files
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig:/usr/local/Cellar/glib/2.66.4/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/Cellar/libffi/3.3/lib/pkgconfig"

# PATH to java home MacOS
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.2.jdk/Contents/Home"

# SET UP NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Virtual Environments
export WORKON_HOME="$HOME/Projects/Environments/Python/virtualenvs"
export PROJECT_HOME="$HOME/Projects/Environments/Python/projects"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# }}}

# Theme, Plugins and Sourcing {{{
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# export ZSH_THEME="af-magic"
export ZSH_THEME="agnoster"

# Set shells
ESHELL="/bin/zsh"
SHELL="/bin/zsh"

# All sources for environment
source /usr/local/bin/virtualenvwrapper.sh

if [ -f "$HOME/.zsh/alias.zsh" ]
then
    source $HOME/.zsh/alias.zsh
fi

# }}}

# source my local exports
if [ -f "$HOME/.zsh/zsh_locals" ]
then
    source ~/.zsh/zsh_locals
fi

## SET UP COLOR
# Change grep color options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
# Set default editor to emacs
export EDITOR="emacs"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
# Default terminal color
if [[ -n "$INSIDE_EMACS" ]]; then
   # export TERM=
else
  export TERM="xterm-256color"
fi
# export TERM="xterm-256color"
export CLICOLOR=1


# Exports for brew
export HOMEBREW_INSTALL_BADGE="☕️ 🐸"

# Export lang pack for system
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8

# LLVM flags
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Path to binary files
export PATH="$PATH:/usr/local/sbin:/usr/sbin:/usr/bin:/usr/local/bin:/sbin:/bin:/usr/games:/usr/local/games:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$HOME/.custom_scripts:$HOME/.rvm/bin:/usr/local/jaxrs-ri/ext:$GOROOT/bin:$GOPATH/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/usr/local/opt/ruby/bin:$GEM_HOME/bin:/usr/local/opt/openjdk@11/bin:$HOME/.composer/vendor/bin:/usr/local/opt/llvm/bin"

# Path for sword
export SWORD_PATH="/Users/randyburrell/Library/Application Support/Sword"

# Set default language type
export LANG=en_US.UTF-8

# }}}
