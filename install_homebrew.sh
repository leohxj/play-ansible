#!/usr/bin/env bash
set -e

# 国内下载的话, 可使用 https://gitee.com/cunkai/HomebrewCN/tree/master 脚本
# 这个镜像解决了 git clone 的问题, 但还是会用 curl 下载 portable-ruby, 所以还是需要 curl 代理

# 全局走 http_proxy 的时候, 设置 git clone 不走代理
git config --global http.proxy ""


# 中科大
ping -c 1 mirrors.ustc.edu.cn
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"

# 清华大学
# ping -c 1 mirrors.tuna.tsinghua.edu.cn
# export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

# 南京大学
# ping -c 1 mirrors.nju.edu.cn
# export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.nju.edu.cn/git/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.nju.edu.cn/git/homebrew-core.git"


# 阿里云 速度最慢, 有时候还连不上
# ping -c 1 mirrors.aliyun.com
# export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/homebrew-core.git"

# 执行此 sh 文件的时候, 还是需要 http_proxy 去处理 githubusercontent 下载
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# --------------------------------------------------
# 拉取 brew install 仓库, 执行 install.sh, 最后还是会从 https://ghcr.io/v2/homebrew/portable-ruby/portable-ruby 下载, 所以还是需要 curl 进行代理
# rm -rf /tmp/brew-install
# git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git /tmp/brew-install
# NONINTERACTIVE=1 /bin/bash /tmp/brew-install/install.sh
# 清理数据
# rm -rf /tmp/brew-install
# --------------------------------------------------
