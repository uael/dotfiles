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
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    alacritty
    alsaUtils
    arandr
    gcc-arm-embedded
    bat
    brave
    ccls
    dwm
    jetbrains.clion
    cmake
    clang
    dmenu
    gawk
    gcc
    gdb
    git
    gnumake
    gnupg
    gnuplot
    hexedit
    lldb
    lsd
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
    vlc
    vscode
    wireshark
  ];

  fonts.fontconfig.enableProfileFonts = true;

  gtk = {
    enable = true;
    font.name = "FuraCode Nerd Font 8";
    theme.package = pkgs.arc-theme;
    theme.name = "Arc-Dark";
    iconTheme.package = pkgs.arc-icon-theme;
    iconTheme.name = "Arc-Dark";
  };
}
