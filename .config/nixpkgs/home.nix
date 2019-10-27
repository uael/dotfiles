{ config, pkgs, ... }:

let
  clang = pkgs.clang_8.overrideAttrs (oldAttrs: { meta.priority = 1; }); 
  dwm = pkgs.dwm.overrideAttrs (oldAttrs: {
    patches = [ ~/.config/suckless/dwm.patches.patch ];
    configurePhase = ''
      cp ${~/.config/suckless/dwm.config.h} config.h;
    '';
  });
  slstatus = pkgs.slstatus.override { conf = builtins.readFile ~/.config/suckless/slstatus.config.h; };
in
{
  nixpkgs.config = { allowUnfree = true; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    alacritty
    alsaUtils
    arc-theme
    arandr
    bat
    brave
    capitaine-cursors
    ccls
    dunst
    dwm
    feh
    jetbrains.clion
    cmake
    clang
    dmenu
    gawk
    gcc
    gcc-arm-embedded
    gdb
    git
    gnome3.nautilus
    gnumake
    gnupg
    gnuplot
    hexedit
    lldb
    lsd
    neofetch
    nerdfonts
    okular
    pango
    pavucontrol
    python
    qbittorrent
    qemu
    rustup
    slock
    slstatus
    tree
    valgrind
    vanilla-dmz
    vlc
    vscode
    wireshark
  ];

  fonts.fontconfig.enableProfileFonts = true;
}
