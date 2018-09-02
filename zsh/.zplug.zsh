#
# uael's dot zplug.zsh
#

# Let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# From oh-my-zsh lib
zplug 'lib/completion',   from:oh-my-zsh
zplug 'lib/key-bindings', from:oh-my-zsh, defer:3

# From oh-my-zsh plugins
zplug 'plugins/adb',        from:oh-my-zsh
zplug 'plugins/battery',    from:oh-my-zsh
zplug 'plugins/cargo',      from:oh-my-zsh
zplug 'plugins/debian',     from:oh-my-zsh
zplug 'plugins/rust',       from:oh-my-zsh
zplug 'plugins/sudo',       from:oh-my-zsh
zplug 'plugins/zsh-reload', from:oh-my-zsh

# From prezto
zplug 'modules/environment', from:prezto
zplug 'modules/terminal',    from:prezto
zplug 'modules/editor',      from:prezto
zplug 'modules/history',     from:prezto
zplug 'modules/directory',   from:prezto
zplug 'modules/spectrum',    from:prezto
zplug 'modules/utility',     from:prezto
zplug 'modules/fasd',        from:prezto
zplug 'modules/git',         from:prezto

zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' dot-expansion 'yes'

# From zsh-users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:1, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:1, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:2, on:"zsh-users/zsh-syntax-highlighting"
