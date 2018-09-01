#
# uael's dot zshrc
#

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  echo "Creating a zgen save"

  echo "Creating a zgen save"

  # prezto options
  zgen prezto editor key-bindings 'emacs'
  zgen prezto prompt theme 'sorin'

  # prezto and modules
  zgen prezto
  zgen prezto git
  zgen prezto command-not-found
  zgen prezto syntax-highlighting

  # plugins
  zgen load /path/to/super-secret-private-plugin

  # save all to init script
  zgen save
fi
