# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # 激活环境变量 use_env(), 目前加载会卡住, 使用 direnv 替代
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autoenv
  # autoenv
  direnv
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dotenv
  # dotenv

  # 多了一些 alias
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew
  brew

  # 显示终端语录
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/chucknorris
  chucknorris

  # 为 man 命令添加语法高亮
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages
  colored-man-pages

  # 控制目录
  # 在进入过的目录之前循环
  dircycle
  # 记录最近访问过的目录, $HOME/.zdirs
  dirpersist

  # 语法高亮, 和底下的 fast-syntax 差不多吧
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colorize
  # colorize

  # 添加 docker 相关 alias
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker
  docker
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose
  docker-compose
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl
  kubectl

  # emoji 支持
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/emoji
  emoji
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/emoji-clock
  emoji-clock

  # git 相关
  git
  tig

  # tmux
  tmux
  tmuxinator
  screen

  # os 层面
  sudo
  supervisor
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemadmin
  systemadmin
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd
  systemd
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/osx
  osx

  # 为 history 添加 alias
  history
  # 记得在 zshrc 中绑定快捷键
  history-substring-search

  # node 支持
  node
  # npx 有问题, 无法加载
  # npm
  # yarn
  # yarn 就用这个
  yarn-autocompletions
  zsh-better-npm-completion

  # 一些软件支持
  nmap
  thefuck
  vscode
  httpie

  # fzf 相关的
  # fzf
  # 和 zsh-interactive-cd 效果一样, 需要在  zsh-autosuggestions or fast-syntax-highlighting 插件之前加载
  fzf-tab

  # fish like
  # 模拟 fish like 效果
  zsh-autosuggestions
  zsh-completions
  fast-syntax-highlighting

  # zsh 配置重新加载
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh_reload
  zsh_reload
)

# 关闭自动 URL 转义, 需要放在 source zsh 之前
DISABLE_MAGIC_FUNCTIONS=true
DISABLE_AUTO_UPDATE=true

# 关闭 dotenv 的提示, 默认直接加载
# ZSH_DOTENV_PROMPT=false

source $ZSH/oh-my-zsh.sh

# bind history-substring-search key
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# ███████╗██╗   ██╗███╗   ██╗ ██████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║
# ██╔══╝  ██║   ██║██║╚██╗██║██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝

# mac 使用 finder 打开当前目录
function open_folder() {
  open .
}
zle -N open_folder
bindkey '^O' open_folder

# 读取当前目录下的 .env 注入为环境变量
load_env() {
  while IFS= read -r var; do
    [[ -n "$var" && ! $var =~ ^#.* ]] && export "$var"
  done <".env"

  echo $fg[green]"*** Environment loaded\n"
}

unload_env() {
  while IFS== read -r var _; do
    [[ -n "$var" && ! $var =~ ^#.* ]] && unset "$var"
  done <".env"

  echo $fg[yellow]"*** Environment unloaded\n"
}

#  █████╗ ██╗     ██╗ █████╗ ███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝
# ███████║██║     ██║███████║███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║
# ██║  ██║███████╗██║██║  ██║███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias kraken='open -na "GitKraken" --args -p $(git rev-parse --show-toplevel)'
alias lg='lazygit'

# aliases
alias flush_dns="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias proxy="export https_proxy=http://127.0.0.1:1087;export http_proxy=http://127.0.0.1:1087;export all_proxy=socks5://127.0.0.1:1080;export HTTPS_PROXY=http://127.0.0.1:1087;export HTTP_PROXY=http://127.0.0.1:1087;export ALL_PROXY=socks5://127.0.0.1:1080;"
alias unproxy="unset https_proxy;unset http_proxy;unset all_proxy;unset HTTPS_PROXY;unset HTTP_PROXY;unset ALL_PROXY"

# 统计耗时
alias scurl='curl -w "%{time_total} \n" -s --output /dev/null'

# 使用 lsd 替代 ls
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# ███████╗███╗   ██╗██╗   ██╗██╗██████╗  ██████╗ ███╗   ██╗███╗   ███╗███████╗███╗   ██╗████████╗
# ██╔════╝████╗  ██║██║   ██║██║██╔══██╗██╔═══██╗████╗  ██║████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
# █████╗  ██╔██╗ ██║██║   ██║██║██████╔╝██║   ██║██╔██╗ ██║██╔████╔██║█████╗  ██╔██╗ ██║   ██║
# ██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██║██╔══██╗██║   ██║██║╚██╗██║██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║
# ███████╗██║ ╚████║ ╚████╔╝ ██║██║  ██║╚██████╔╝██║ ╚████║██║ ╚═╝ ██║███████╗██║ ╚████║   ██║
# ╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 镜像设置
export NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/
export ELECTRON_BUILDER_BINARIES_MIRROR=http://npm.taobao.org/mirrors/electron-builder-binaries/
# export PUPPETEER_DOWNLOAD_HOST=https://npm.taobao.org/mirrors
export SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass

# github
export GITHUB_AUTH="8d57481dbb6fa65010614c969a0d2315057fa383"

# 优先使用 npm
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin

export PATH="/usr/local/sbin:$PATH"

# Created by `userpath` on 2020-05-23 08:48:42
export PATH="$PATH:/Users/leohxj/.local/bin"

# tmuxinator
export EDITOR='code'

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# go
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# flutter
export FLUTTERPATH=$HOME/opt/flutter
export PATH=$PATH:$FLUTTERPATH/bin
export PATH=$PATH:$HOME/.pub-cache/bin

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kubectl
source <(kubectl completion zsh)

# kubecm
source <(kubecm completion zsh)

# k3d
source <(k3d completion zsh)

# kind, 需要配置 mkdir $ZSH/completions/, kind completion zsh > $ZSH/completions/_kind

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# the fuck
eval $(thefuck --alias)

# mcfly
eval "$(mcfly init zsh)"
zle -N mcfly-history-widget
bindkey '^H' mcfly-history-widget

# navi
eval "$(navi widget zsh)"

# cowsay
chuck_cow

# broot
source /Users/leohxj/.config/broot/launcher/bash/br

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr              # hh to be alias for hstr
setopt histignorespace     # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor # get more colors

# forgit
[ -f ~/.oh-my-zsh/custom/plugins/forgit/forgit.plugin.zsh ] && source ~/.oh-my-zsh/custom/plugins/forgit/forgit.plugin.zsh



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/2.2.19/gems/vagrant-2.2.19/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
