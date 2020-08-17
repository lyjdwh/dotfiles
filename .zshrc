# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/liuyan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://gEnables the zsh completion from git.git folks, which is much faster than the official one from zsh. A lot of zsh-specific features are not supported, like descriptions for every argument, but everything the bash completion has, this one does too (as it is using it behind the scenes). Not only is it faster, it should be more robust, and updated regularly to the latest git upstream version.ithub.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell-modified"

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
plugins=(git git-extras vi-mode  thefuck sudo extract copydir command-not-found web-search common-aliases debian colored-man-pages)

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/antigen.zsh

antigen bundle wfxr/forgit
antigen bundle skywind3000/z.lua
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
# antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle kutsan/zsh-system-clipboard
antigen bundle Aloxaf/fzf-tab
antigen bundle hlissner/zsh-autopair
antigen bundle sobolevn/wakatime-zsh-plugin
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle MichaelAquilina/zsh-auto-notify

# Tell Antigen that you're done.
antigen apply

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

unalias fd
alias od="xdg-open ."
alias sz="source ~/.zshrc"
alias vz="et ~/.zshrc"
alias ai="sudo pacman -S"
alias ar="sudo pacman -Rns"
alias au="sudo pacman -Syu"
alias as="sudo pacman -Ss"
alias ra="ranger"
alias sra='sudo -E ranger'
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
alias rm="rm -f" # rm -iv 删除时提醒
#cp, mv 时显示进度条
alias rscp="rsync -ahP"
alias rsmv="rsync -ahP --remove-source-files"
alias s="screenfetch"
alias lg='lazygit'
alias sslab1="sshfs lab1:/data/liuyan /home/liuyan/lab1"
alias sslab2="sshfs lab2:/data1/liuyan /home/liuyan/lab2"
alias record="asciinema rec"  #ctrl+d to quit
alias tz="trans -e google -s auto -t zh-CN -show-original y -show-original-phonetics y -show-translation y -no-ansi -show-translation-phonetics n -show-prompt-message n -show-languages n -show-original-dictionary n -show-dictionary y -show-alternatives n "
alias te="trans -e google -s auto -t en -show-original y -show-original-phonetics y -show-translation y -no-ansi -show-translation-phonetics n -show-prompt-message n -show-languages n -show-original-dictionary n -show-dictionary y -show-alternatives n "
#alias curl="curl -x socks5://127.0.0.1:1080"
# Download videos from YouTube, youku ....

alias yd="youtube-dl --external-downloader 'axel'  --external-downloader-args '-n 16' -ic "
alias wn="watch -n 5 -d nvidia-smi"
alias sudo='sudo -E'
alias c='clear'
alias fzf="fzf -m" # multi-select mode, TAB and Shift-TAB to mark multiple items
alias ta="tmux attach"
alias ut="~/.tmux/plugins/tpm/bin/update_plugins all"
alias q="exit"
alias m="tldr"
source ~/.zsh_aliases

export RANGER_LOAD_DEFAULT_RC=false
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=green'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=true
#fzf
#usage: command + ** +tab ...
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS='--bind ctrl-n:down,ctrl-p:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='**' # tab/** + tab
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
export PATH=/home/liuyan/.conda/envs/torch/bin:$PATH
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export EDITOR="emacsclient -t"
export _FASD_DATA="$HOME/.zlua"
export RANGER_ZLUA="/home/liuyan/.antigen/bundles/skywind3000/z.lua/z.lua"
export GTAGSLABEL=pygments
export TERM=xterm-256color
# Meta: ^[, Ctrl: ^
export MARKER_KEY_GET='^b'
export MARKER_KEY_NEXT_PLACEHOLDER='^n'
export YSU_MESSAGE_POSITION="after"

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
# Alt-space: search for commands that match the current written string in the command-line.
# Ctrl-k (or marker mark): Bookmark a command.
# Alt-n: place the cursor at the next placeholder, identified by '{{anything}}'
# marker remove: remove a bookmark
[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

#keybindings
zle -N history-substring-search-up
zle -N history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M vicmd 'K' up-line-or-history
bindkey -M vicmd 'J' down-line-or-history

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^o' autosuggest-accept

# Don't take 0.4s to change modes
export KEYTIMEOUT=20
export zsh_input_method=1

function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]] && [[ $(/usr/bin/fcitx5-remote) == 2 ]] ; then
        echo -ne '\e[1 q'
        /usr/bin/fcitx5-remote -c
        zsh_input_method=2
	elif [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]] &&[[ $zsh_input_method == 2 ]]; then
		echo -ne '\e[5 q'
        /usr/bin/fcitx5-remote -o
        zsh_input_method=1
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

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

cd_sibling() {
  cd $(ls --dired |fzf)
}
zle -N cd_sibling
bindkey '^S' cd_sibling

fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	    echo "opening $file" &&
	    xdg-open "$file"
}

k(){
    if [[ $1 == "wechat" ]]; then
        pgrep "WeChat" | xargs kill
    elif [[ $1 == "tim" ]];then
        pgrep "TIM" | xargs kill
    else
        pgrep $1 | xargs kill
    fi
}
# fortune
