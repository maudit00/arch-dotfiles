# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
export QUTE_QT_WRAPPER=PyQt6
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/brucaliffo/.local/share/flatpak/exports/share"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh
# source $HOME/.cargo/env


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="amuse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-bat git fzf  zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-vi-mode)

source $ZSH/oh-my-zsh.sh
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
# export EDITOR='vim'
#else
# export EDITOR='nvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"
alias i3c="nvim ~/.config/i3/config"
alias polyc="nvim ~/.config/polybar/config.ini"
alias c="clear"
alias pluto='mpv https://raw.githubusercontent.com/Brenders/Pluto-TV-Italia-M3U/main/PlutoItaly.m3u'

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
#alias zshconfig="vim ~/.zshrc"
#alias ohmyzsh ="vim ~/.oh-my-zsh"

# Created by `pipx` on 2024-09-24 23:36:12
export PATH="$PATH:/home/bruca/.local/bin"
alias expa="sh ~/expall.sh"
alias addlang="sed -i 's/<body/<body xml:lang=\"it\"/' *.html"
alias addlangen="sed -i 's/<body/<body xml:lang=\"en\"/' *.html"
alias addscripteni= /usr/bin/add-script-eni.sh
alias zrm="find . -name \"*Zone.Identifier\" -type f -delete"
alias c='clear'
alias n='nvim'
alias config='/usr/bin/git --git-dir=/home/bruca/.cfg/ --work-tree=/home/bruca'
alias sedx="sed -i 's/^ *//g' index.html"
alias mjmlx="mjml index.mjml -o index.html"
alias mjmlw="mjml -w index.mjml -o index.html"
alias fzmj="mjml -w \$(fzf) -o"
alias sedmj="mjml index.mjml -o index.html && sed -i 's/^ *//g' index.html"
alias zippa="zip -r zippo-h index.html img/ && zip -r zippo-m index.mjml img/"
alias zshrc="nvim ~/.zshrc"
alias docu="/mnt/c/Users/ddamario/OneDrive\ -\ Jakala\ SpA\/Documenti/"
alias down="/mnt/c/Users/ddamario/Downloads"
eval "$(zoxide init zsh)"
alias alac='vim ~/.config/alacritty/alacritty.toml'
alias syu='sudo pacman -Syu'
alias sy='sudo pacman -Sy'
alias ss='sudo pacman -Ss'
alias rs='sudo pacman -Rs'
alias rsnc='sudo pacman -Rsnc'
alias kcfg='sudo vim ~/.config/kitty/kitty.conf'
alias hcfg='sudo vim ~/.config/hypr/hyprland.conf'
alias wcfg=' nvim ~/.config/waybar/'
alias sedll="sed -i 's/^ *//g' *.html"
alias sedall='for file in $(find . -type f -name "*.html"); do sed -i "s/^ *//g" "$file"; done'
# alias ls='ls -lah'
#
# Created by `pipx` on 2024-10-28 12:36:49
export PATH="$PATH:/home/brucadesk/.local/bin"
export EDITOR=nvim
