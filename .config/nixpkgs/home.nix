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
  clion = pkgs.lib.overrideDerivation pkgs.jetbrains.clion (oldAttrs: rec {
    name = "clion-${version}";
    version = "2020.1.1";
    src = pkgs.fetchurl {
      url = "https://download.jetbrains.com/cpp/CLion-${version}.tar.gz";
      sha256 = "b476b1217d3e9d7bd7af655748c215e04d3350c0f9e3fefc7a3af76967856604";
    };
    postFixup = ''
       ln -s $out/clion-${version} $out/clion-2020.1
       ${oldAttrs.postFixup}
    '';
  });
in
{
  nixpkgs.config = { allowUnfree = true; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    alacritty
    alsaUtils
    arandr
    acpi
    bat
    binutils
    bluez
    brave
    capitaine-cursors
    #ccls
    discord
    dunst
    dwm
    feh
    fish
    cmake
    jetbrains.clion
    #clion
    clang
    dmenu
    gawk
    gcc
    #gcc_multi
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
    okular
    pango
    pavucontrol
    python
    qbittorrent
    #qemu
    #rustup
    slock
    slstatus
    tree
    usbutils
    valgrind
    vanilla-dmz
    vlc
    wireshark
    zig
  ];

  fonts.fontconfig.enableProfileFonts = true;
}
