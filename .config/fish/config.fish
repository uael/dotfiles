# Remove Intro message
set fish_greeting

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo \
      $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

add_to_path ~/.local/bin
add_to_path ~/.cargo/bin
add_to_path ~/.nix-profile/bin

alias ls=lsd
alias cat=bat
