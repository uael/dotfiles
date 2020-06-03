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
       #ln -s $out/clion-${version} $out/clion-2020.1.1
       ${oldAttrs.postFixup}
       patchelf \
            --set-rpath "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib pkgs.zlib ]}" \
            $out/clion-2020.1.1/bin/clang/linux/clangd
    '';
  });
  firamono = pkgs.fetchzip {
    name = "firamono-nerdfont-2.1.0";

    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip";

    postFetch = ''
      mkdir -p $out/share/fonts/firamono-nerdfont
      unzip -j $downloadedFile -d $out/share/fonts/firamono-nerdfont
    '';

    sha256 = "1gwh6m3p48wav0ckn7qzr43h1yn82627b7glkhn5dkffz0cphypa";

    meta = with pkgs.lib; {
      description = ''
        Nerd Fonts is a project that attempts to patch as many developer targeted
        and/or used fonts as possible. The patch is to specifically add a high
        number of additional glyphs from popular 'iconic fonts' such as Font
        Awesome, Devicons, Octicons, and others.
      '';
      homepage = https://github.com/ryanoasis/nerd-fonts;
      license = licenses.mit;
      platforms = platforms.all;
    };
  };
in
{
  nixpkgs.config = { allowUnfree = true; };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager.enable = true;
    feh.enable = true;
    man.enable = true;
    lsd.enable = true;
    bat.enable = true;
  };

  services.lorri.enable = true;

  home = {
    stateVersion = "20.03";
    packages = with pkgs; [
      acpi
      alacritty
      arandr
      arc-theme
      arc-icon-theme
      binutils
      brave
      capitaine-cursors
      clion
      direnv
      discord
      dmenu
      dunst
      dwm
      firamono
      fish
      git
      neofetch
      okular
      pango
      pavucontrol
      qbittorrent
      slock
      slstatus
      vanilla-dmz
    ];
  };
}
