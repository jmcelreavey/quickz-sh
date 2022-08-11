export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# This file is created by ezsh setup.
# Place all your .zshrc configurations / overrides in a single or multiple files under ~/.config/ezsh/zshrc/ folder
# Your original .zshrc is backed up at ~/.zshrc-backup-%y-%m-%d


# Load ezsh configurations
source "$HOME/.config/ezsh/ezshrc.zsh"

# Any zshrc configurations under the folder ~/.config/ezsh/zshrc/ will override the default ezsh configs.
# Place all of your personal configurations over there
ZSH_CONFIGS_DIR="$HOME/.config/ezsh/zshrc"

if [ "$(ls -A $ZSH_CONFIGS_DIR)" ]; then
    for file in "$ZSH_CONFIGS_DIR"/*; do
        source "$file"
    done
fi

# Now source oh-my-zsh.sh so that any plugins added in ~/.config/ezsh/zshrc/* files also get loaded
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add to PATH to Install and run programs with "pip install --user"
export PATH=$PATH:~/.local/bin

NPM_PACKAGES="${HOME}/.npm"
PATH="$NPM_PACKAGES/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

export MARKER_KEY_NEXT_PLACEHOLDER="\C-b"   #change maker key binding from Ctr+t to Ctr+b

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

export PATH=$PATH:~/.quickzsh/todo/bin    #usig alias doesn't properly work

autoload -U compinit && compinit        # zsh-completions
# autoload bashcompinit                 # bash completions
# bashcompinit


# CUSTOM ALIASES

SAVEHIST=50000      #save upto 50,000 lines in history. oh-my-zsh default is 10,000
#setopt hist_ignore_all_dups     # dont record duplicated entries in history during a single session

alias myip="wget -qO- https://wtfismyip.com/text"	# quickly show external ip address
alias l="ls -lah"
alias x="exit"
alias k="k -h"						# show human readable filesizes, in kb, mb etc


# CUSTOM FUNCTIONS

# cheat sheets (github.com/chubin/cheat.sh), find out how to use commands
# example 'cheat tar'
# for language specific question supply 2 args first for language, second as the question
# eample: cheat python3 execute external program
cheat() {
    if [ "$2" ]; then
        curl "https://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
        curl "https://cheat.sh/$1"
    fi
}

# Matrix screen saver! will run if you have installed "cmatrix"
# TMOUT=900
# TRAPALRM() { if command -v cmatrix &> /dev/null; then cmatrix -sb; fi }

speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}

dadjoke() {
    curl https://icanhazdadjoke.com
}

# Find dictionary definition
dict() {
    if [ "$3" ]; then
        curl "dict://dict.org/d:$1 $2 $3"
    elif [ "$2" ]; then
        curl "dict://dict.org/d:$1 $2"
    else
        curl "dict://dict.org/d:$1"
    fi
}

# Find geo info from IP
ipgeo() {
    # Specify ip or your ip will be used
    if [ "$1" ]; then
        curl "http://api.db-ip.com/v2/free/$1"
    else
        curl "http://api.db-ip.com/v2/free/$(myip)"
    fi
}

# Show covid-19 spread stats
corona() {
    # Specify country otherwise shows stats for all
    if [ "$1" ]; then
        curl "https://corona-stats.online/$1"
    else
        curl "https://corona-stats.online"
    fi
}
