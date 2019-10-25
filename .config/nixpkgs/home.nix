{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    alacritty
    alsaUtils
    arandr
    gcc-arm-embedded
    brave
    ccls
    jetbrains.clion
    cmake
    dmenu
    gawk
    gcc
    gdb
    git
    gnumake
    gnupg
    gnuplot
    hexedit
    pkgs.lldb
    nerdfonts
    okular
    pango
    pavucontrol
    python
    qbittorrent
    qemu
    slock
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
