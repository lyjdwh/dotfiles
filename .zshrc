module_path+=( "$HOME/.zinit/module/Src")
zmodload zdharma_continuum/zinit

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# theme
zinit snippet OMZL::git.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet https://github.com/lyjdwh/dotfiles/blob/master/robbyrussell-modified.zsh-theme

# oh my zsh plugin
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZP::git
zinit snippet OMZP::git-extras
zinit snippet OMZP::sudo
zinit snippet OMZP::copydir
zinit snippet OMZP::command-not-found
zinit snippet OMZP::web-search
zinit snippet OMZP::common-aliases

zinit ice svn
zinit snippet OMZP::extract
zinit ice svn
zinit snippet OMZP::colored-man-pages

# github plugin
zinit light IngoMeyer441/zsh-easy-motion
zinit snippet OMZP::vi-mode
zinit light romkatv/zsh-defer

zinit ice lucid wait='0' atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting

zinit wait="0" lucid light-mode for \
      wfxr/forgit \
      skywind3000/z.lua \
      changyuheng/fz \
      zsh-users/zsh-completions \
      zsh-users/zsh-history-substring-search \
      kutsan/zsh-system-clipboard \
      Aloxaf/fzf-tab \
      hlissner/zsh-autopair \
      sobolevn/wakatime-zsh-plugin \
      MichaelAquilina/zsh-you-should-use \
      MichaelAquilina/zsh-auto-notify \
      vifon/zranger

### End of Zinit's installer chunk

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

# export EDITOR="lvim"
export EDITOR="emacsclient -t -a lvim"

[ -f ~/.private/zshrc ] && source ~/.private/zshrc
source ~/.zsh_aliases
alias vim="lvim"
alias v="lvim"
alias od="xdg-open ."
alias sz="source ~/.zshrc"
alias vz="$EDITOR ~/.zshrc"
alias vv="$EDITOR ~/.vimrc"
alias vg="$EDITOR ~/.gitconfig"
alias ai="sudo pacman -S"
alias ar="sudo pacman -Rns"
alias au="sudo pacman -Syu"
# alias ac="pacman -Qdtq | sudo pacman -Rs"
alias as="pacman -Ss"
alias at="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20"
alias yay="yay --aur"
alias yi="yay -S"
alias yu="yay -Syu"
alias ys="yay -Ss"
alias ranger="TERM=xterm-256color ranger"
alias ra="TERM=xterm-256color ranger"
alias sra='sudo -E ranger'
alias pc="proxychains -q"
#alias pa="pacapt"
alias co="conda"
alias coa="conda activate"
alias cod="conda deactivate"
alias coi="conda install"
alias coui="conda uninstall"
alias proxy="export http_proxy=http://127.0.0.1:12333; export https_proxy=http://127.0.0.1:12333"
alias proxyss="export http_proxy=http://172.16.1.135:3128; export https_proxy=http://172.16.1.135:3128"
alias unproxy="unset http_proxy; unset https_proxy"
alias pp="ptipython"
alias dstat='dstat -cdlmnpsy'
alias clean='sudop sh -c "echo 3 > /proc/sys/vm/drop_caches"'
alias ed='emacs --daemon'
alias ec='emacsclient -c -n'
alias e='emacsclient -t -a lvim'
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
alias s="neofetch"
alias lg='lazygit'
alias sslab1="sshfs lab1:/data/liuyan $HOME/labs/lab1"
alias sslab2="sshfs lab2:/data1/liuyan $HOME/labs/lab2"
alias sslab3="sshfs lab3:/data/liuyan $HOME/labs/lab3"
alias record="asciinema rec"  #ctrl+d to quit
alias tz="trans -e google -s auto -t zh-CN -show-original y -show-original-phonetics y -show-translation y -no-ansi -show-translation-phonetics n -show-prompt-message n -show-languages n -show-original-dictionary n -show-dictionary y -show-alternatives n -pager bat"
alias te="trans -e google -s auto -t en -show-original y -show-original-phonetics y -show-translation y -no-ansi -show-translation-phonetics n -show-prompt-message n -show-languages n -show-original-dictionary n -show-dictionary y -show-alternatives n -pager bat"
#alias curl="curl -x socks5://127.0.0.1:1080"
# Download videos from YouTube, youku ....

alias yd="youtube-dl --external-downloader 'axel'  --external-downloader-args '-n 16' -ic "
alias wn="watch -n 5 -d nvidia-smi"
alias wn2="watch --color -n1 gpustat -cpu"
alias sudo='sudo -E'
alias c='clear'
alias fzf="fzf -m" # multi-select mode, TAB and Shift-TAB to mark multiple items
alias ta="tmux attach"
alias sta="tmux attach"
alias stm="tmux"
alias ut="~/.tmux/plugins/tpm/bin/update_plugins all"
alias q="exit"
alias m="proxychains -q tldr"
alias osi="optimus-manager --switch intel"
alias osn="optimus-manager --switch nvidia"
alias -g hg="--help 2>&1 |grep -Ei" # vim hg "vim|diff"
alias chts="cht --shell"
alias chp="cht --shell python"
alias man="man -L zh_CN"
alias gc="git clone"
alias wg="google"
alias wh="github"
alias port="netstat -tunlp | grep"
alias tm="trash"
alias t0="trash-empty"
alias t1="trash-restore"
alias tl="trash-list"
alias kb="kill %1"
alias 0="cd ~"
alias rs="rsync -av /home/liuyan/bin/PaddleDetection/ --exclude={'PaddleDetection/output','PaddleDetection/models','PaddleDetection/arun_log','*.pyc'} ss86:/mnt/lustre/liuyan/PaddleDetection"
alias loc="tokei"
alias mm="emacsclient -t -eval '(netease-cloud-music)'"
alias zu="zinit update"
alias zt="zpmod source-study"
alias df="/usr/bin/duf"
alias um="proxychains -q mbsync -a"

export RANGER_LOAD_DEFAULT_RC=false
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=green'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=true
#fzf
#usage: command + ** +tab ...
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS='--bind ctrl-n:down,ctrl-p:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='88' # tab/88 + tab
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
export PATH=$HOME/.conda/envs/torch/bin:$PATH
export PATH=$HOME/doom-emacs/bin:$PATH
export ZSH_WAKATIME_BIN=/usr/bin/wakatime
export _FASD_DATA="$HOME/.zlua"
export RANGER_ZLUA="$HOME/.zinit/plugins/skywind3000---z.lua/z.lua"
export _ZL_HYPHEN=1 # 为z 支持连字符-
export GTAGSLABEL=pygments
export TERM=st-direct
# Meta: ^[, Ctrl: ^
export MARKER_KEY_GET='^b'
export MARKER_KEY_NEXT_PLACEHOLDER='^n'
export YSU_MESSAGE_POSITION="after"
export LSP_USE_PLISTS=true

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
eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zstyle ':fzf-tab:*' fzf-bindings 'tab:toggle' 'ctrl-a:toggle-all' 'ctrl-o:accept'
zstyle ':completion:*' sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.lessfilter %s'

#keybindings
zle -N history-substring-search-up
zle -N history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M vicmd 'K' up-line-or-history
bindkey -M vicmd 'J' down-line-or-history

zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^o' autosuggest-accept
autoload -U zranger
bindkey -s '^]' 'zranger\n'

bindkey -M vicmd ' ' vi-easy-motion

function _z() { _zlua "$@"; }

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

kp(){
    if [[ $1 == "wechat" ]]; then
        pgrep "WeChat" | xargs kill -9
    elif [[ $1 == "wxwork" ]];then
        pgrep "WXWork" | xargs kill -9
    elif [[ $1 == "tim" ]];then
        pgrep "TIM" | xargs kill -9
    else
        pkill $1
    fi
}

topp(){
    top -p $(pgrep -d ',' $1) #process name
}

fp() {
    ps aux | head -n 1
    ps aux | grep -E $1 | grep -v grep
}

cmp(){
    ps aux | grep -E $1 | grep -v grep |awk '{s+=$3} END {mem=s*160 ;print "cpu: " s " % ;" mem " M"}'
    ps aux | grep -E $1 | grep -v grep |awk '{s+=$4} END {mem=s*160 ;print "mem: " s " % ;" mem " M"}'
}

pcpu(){
    ps aux | grep -E $1 | grep -v grep |awk '{s+=$3} END {mem=s*160 ;print "cpu: " s " % ;" mem " M"}'
}

pmem(){
    ps aux | grep -E $1 | grep -v grep |awk '{s+=$4} END {mem=s*160 ;print "mem: " s " % ;" mem " M"}'
}

todo() {
    emacsclient --eval '(org-agenda-list)'
}

fman() {
    man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}

in() {
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

re() {
      yay -Qq | fzf -q "$1" -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns
}

ac() {
    sudo pacman -Rs $(pacman -Qtdq)
}

conda_init_fun () {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
            . "/opt/anaconda/etc/profile.d/conda.sh"
        else
            export PATH="/opt/anaconda/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}
zsh-defer conda_init_fun

init_nvm (){
    source /usr/share/nvm/init-nvm.sh
}
zsh-defer init_nvm
