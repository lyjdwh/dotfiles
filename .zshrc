# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/liuyan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://gEnables the zsh completion from git.git folks, which is much faster than the official one from zsh. A lot of zsh-specific features are not supported, like descriptions for every argument, but everything the bash completion has, this one does too (as it is using it behind the scenes). Not only is it faster, it should be more robust, and updated regularly to the latest git upstream version.ithub.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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


# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.  # DISABLE_LS_COLORS="true"

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
plugins=(git git-extras alias-tips zsh-completions vi-mode  thefuck sudo history-substring-search extract z.lua
copydir zsh-autosuggestions zsh-syntax-highlighting command-not-found web-search ranger-autojump common-aliases debian forgit)

source $ZSH/oh-my-zsh.sh
# source /home/liuyan/.oh-my-zsh/custom/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh

# User configuration
setopt no_nomatch
#Remove superfluous blanks from each command line being added to the history list
setopt histreduceblanks
#Do not enter command lines into the history list if they are duplicates of the previous event.
setopt histignorealldups
# Automatically use menu completion after the second consecutive request for completion
setopt automenu
# Try to correct the spelling of commands
setopt correct
#NOCLOBBER prevents you from accidentally overwriting an existing file.
setopt noclobber
compdef -d mcd

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

alias od="xdg-open ."
alias sz="source ~/.zshrc"
alias vz="et ~/.zshrc"
alias ai="sudo pacman -S"
alias ar="sudo pacman -Rs"
alias au="sudo pacman -Syu"
alias as="sudo pacman -Ss"
alias ra="ranger"
alias pc="proxychains -q"
#alias pa="pacapt"
alias co="conda"
alias coa="conda activate"
alias cod="conda deactivate"
alias coi="conda install"
alias coui="conda uninstall"
alias proxy="export http_proxy=http://127.0.0.1:12333"
alias unproxy="unset http_proxy"
alias pi="ptipython"
alias dstat='dstat -cdlmnpsy'
alias clean='sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"'
alias ed='emacs --daemon'
alias ec='emacsclient -c -n'
alias et='emacsclient -t'
alias ez='emacs -nw'
alias scpr="rsync -P --rsh=ssh"
alias wget="wget -c"
alias mkdir="mkdir -p"
alias zz='z -c' # 严格匹配当前路径的子路径
alias zi='z -i' # 使用交互式选择模式
alias zf='z -I' # 使用 fzf 对多个结果进行选择
alias zb='z -b' # 快速回到父目录
alias rm="rm -f"
#cp, mv 时显示进度条
alias rscp="rsync -ahP" 
alias rsmv="rsync -ahP --remove-source-files"
alias s="screenfetch"
alias lg='lazygit'
alias sslab="sshfs lab:/data/liuyan /home/liuyan/server"

export RANGER_LOAD_DEFAULT_RC=false
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=green'
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export PATH=/home/liuyan/.conda/envs/torch/bin:$PATH
export EDITOR="emacsclient -t"

#修改按键caps->esc, space->ctrl,空格键在按住时作为附加的ctrl键
#使用caps2esc
#setxkbmap -layout us -option caps:escape
#spare_modifier="Hyper_L"
#xmodmap -e "keycode 65 = $spare_modifier"
#xmodmap -e "remove mod4 = $spare_modifier" # hyper_l is mod4 by default
#xmodmap -e "add Control = $spare_modifier"
##Map space to an unused keycode (to keep it around for xcape to use)
#xmodmap -e "keycode any = space"
##Finally use xcape to cause the space bar to generate a space when tapped.
#xcape -e "$spare_modifier=space"


#export LC_CTYPE=zh_CN.UTF-8
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /opt/anaconda/etc/profile.d/conda.sh

#keybindings
zle -N history-substring-search-up
zle -N history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^o' autosuggest-accept
mcd(){
  mkdir -p $1
  cd $1
}

cdlast() {
  cd -
#  ls -lrth --color=auto | tail
    zle reset-prompt
}
zle -N cdlast
bindkey '^Q' cdlast

brew() {
    PATH="/home/liuyan/.linuxbrew/bin:$PATH" /home/liuyan/.linuxbrew/bin/brew "$@"
}

xo() {
  nohup xdg-open $1
  rm nohup.out
}

cd_sibling() {
  cd $(ls --dired |fzf)
}
zle -N cd_sibling
bindkey '^S' cd_sibling
