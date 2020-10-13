# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/whyn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Load OMZ Git library
zinit snippet OMZL::git.zsh

# Load Git plugin from OMZ
zinit snippet OMZP::git
zinit cdclear -q # <- forget completions provided up to this moment
setopt promptsubst

zinit ice wait lucid
zinit snippet OMZP::thefuck

zinit ice as"completion" wait"1" lucid
zinit snippet OMZP::adb/_adb

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
zinit ice depth=1 atload'!source ~/.p10k.zsh'
zinit light romkatv/powerlevel10k

# zinit ice from"gh-r" as"program" mv"nvim* -> nvim" pick"nvim/bin/nvim" id-as"neovim" nocompletions
# zinit light neovim/neovim

zinit ice from"gh-r" as"program" bpick"*amd64*.deb" pick"usr/bin/bat"
zinit light sharkdp/bat

# zinit ice id-as"dotfiles" atclone"./bootstrap.sh" atpull"%atclone"
# zinit light Why8n/dotfiles

# zinit ice atload"./install.py" atpull"./install.py"
# zinit light wting/autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh  ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

zinit wait lucid light-mode for                                  \
  atinit"zicompinit; zicdreplay"                                 \
      zdharma/fast-syntax-highlighting                           \
  atload"_zsh_autosuggest_start;bindkey '^N' autosuggest-accept" \
      zsh-users/zsh-autosuggestions                              \
  blockf atpull'zinit creinstall -q .'                           \
      zsh-users/zsh-completions

# zinit ice as"completion" if'[[ -n "$commands[tmux]" ]]' wait
zinit ice as"completion" has"tmux" wait lucid
zinit snippet https://github.com/imomaliev/tmux-bash-completion/tree/master/completions/tmux


[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh
if  command -v rg > /dev/null; then
    # export FZF_DEFAULT_COMMAND='rg --files . --hidden -uuu --glob "!.git/**" --glob "!node_modules/**"'
    export FZF_DEFAULT_COMMAND='rg --files . --hidden -uuu --glob "!**/.git/**" --glob "!**/node_modules/**"'
fi
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview 
				"[[ $(file --mime {}) =~ binary ]]      &&
                 echo {} is a binary file               ||
                 (bat --style=numbers --color=always {} ||
                  highlight -O ansi -l {}               ||
                  coderay {}                            ||
                  rougify {}                            ||
                  cat {}) 2> /dev/null | head -500" 
				  --preview-window=down'


[ -d /mnt/c/Windows/System32 ] && export PATH=$PATH:/mnt/c/Windows/System32
[ -d /mnt/d/apps ] && export PATH=$PATH:/mnt/d/apps
# export TERM=xterm-256color
# reset ls background for directory
[ -f $HOME/.dircolors ] && eval $(dircolors -b $HOME/.dircolors)


alias cls=clear

# wget --no-check-certificate https://raw.githubusercontent.com/LaiJingli/rmtrash/master/rmtrash.sh
alias rm=/usr/local/bin/rmtrash.sh
# nickname for voldikss/vim-floaterm
# in neovim terminal,using command: nvi xxx,to open file in current neovim instance,so that we can edit
# notice: make sure to: pip3 install neovim-remote
alias nvi=floaterm
alias sudo='sudo env PATH=$PATH'

# key bindings
bindkey -s '^o' 'cd ~/program/github/dotfiles/\n'
# <C-n> to accept zsh-autosuggestions
# bindkey '^N' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# for pipenv
export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
PATH="$PATH:$PYTHON_BIN_PATH"
