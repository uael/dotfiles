#
# uael's dot zplug.zsh
#

# Let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# From prezto
zplug 'modules/environment', from:prezto
zplug 'modules/terminal',    from:prezto
zplug 'modules/editor',      from:prezto
zplug 'modules/history',     from:prezto
zplug 'modules/directory',   from:prezto
zplug 'modules/spectrum',    from:prezto
zplug 'modules/utility',     from:prezto
zplug 'modules/completion',  from:prezto
zplug 'modules/git',         from:prezto
zplug 'modules/prompt',      from:prezto

zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:prompt' theme 'sorin'

# From zsh-users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# Enhanced cd
zplug "b4b4r07/enhancd", use:enhancd.sh
