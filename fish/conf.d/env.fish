# 基础 XDG 路径
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME  $HOME/.cache
set -gx XDG_DATA_HOME   $HOME/.local/share
set -gx XDG_STATE_HOME  $HOME/.local/state

# 针对特定工具的路径重定向
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npmrc
set -gx NODE_REPL_HISTORY     $XDG_STATE_HOME/node_history

set -gx COLIMA_HOME           $XDG_CONFIG_HOME/colima
set -gx DOCKER_CONFIG         $XDG_CONFIG_HOME/docker

set -gx PI_CODING_AGENT_DIR   $XDG_CONFIG_HOME/pi/agent
set -gx PI_CODING_AGENT_SESSION_DIR $XDG_STATE_HOME/pi/sessions

set -gx PYTHON_HISTORY        $XDG_STATE_HOME/python_history
set -gx REDISCLI_HISTFILE     $XDG_STATE_HOME/rediscli_history
set -gx MYSQL_HISTFILE        $XDG_STATE_HOME/mysql_history
set -gx SQLITE_HISTORY        $XDG_STATE_HOME/sqlite_history

# 自定义配置
set -gx EDITOR nvim
# set -gx EDITOR "code --wait"
# set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
# set -gx LANG en_US.UTF-8

# 删除 fish 问候语
set -g fish_greeting

# brew 镜像
# set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
# set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
