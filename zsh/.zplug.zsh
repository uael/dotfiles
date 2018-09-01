#
# uael's dot zplug.zsh
#

# From prezto
zplug "modules/history",    from:prezto
zplug "modules/utility",    from:prezto
zplug "modules/terminal",   from:prezto
zplug "modules/editor",     from:prezto
zplug "modules/directory",  from:prezto
zplug "modules/completion", from:prezto
zplug "modules/git",        from:prezto
zplug "modules/prompt",     from:prezto

# From zsh-users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# Enhanced cd
zplug "b4b4r07/enhancd", use:enhancd.sh
