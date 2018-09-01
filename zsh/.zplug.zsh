#
# uael's dot zplug.zsh
#

zplug "zplug/zplug", hook-build:"zplug --self-manage"

# From prezto
zplug "modules/history",    from:prezto
zplug "modules/utility",    from:prezto
zplug "modules/terminal",   from:prezto
zplug "modules/editor",     from:prezto
zplug "modules/directory",  from:prezto
zplug "modules/completion", from:prezto

# From zsh-users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# From oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

# Enhanced cd
zplug "b4b4r07/enhancd", use:enhancd.sh
