{ config, impHPkg, lib, zig, pkgs, pkgs-unstable, ... }:

{
  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    DEFAULT_BROWSER = "firefox";
    TERMINAL = "kitty";
  };


  #environment.etc."current-system-packages".text =

  /*
  let
     packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
     sortedUnique = builtins.sort builtins.lessThan (lib.unique packages);
     formatted = builtins.concatStringsSep "\n" sortedUnique;
  in
    formatted;
  */

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    pkgs.xwayland
    pkgs.swaylock
    pkgs.swaybg
    pkgs.waybar
    pkgs.swayidle

    zig.packages."x86_64-linux".master

    pkgs.wofi
    pkgs.gtk3
    pkgs.vulkan-tools
    pkgs.mako
    pkgs.parallel
    pkgs.dnglab
    pkgs-unstable.darktable
    pkgs.ranger
    pkgs.element-desktop
    pkgs.xournalpp
    pkgs.s5cmd
    pkgs.rclone
    pkgs.tor-browser
    pkgs.ranger
    pkgs.keepassxc
    pkgs.xclip
    pkgs.gzip
    pkgs.nodejs
    pkgs.gotop
    pkgs.flameshot
    pkgs.libreoffice
    pkgs.tmate
    pkgs.tailscale
    pkgs.firefox
    pkgs.spotify
    pkgs.go_1_21
    pkgs.rustc
    pkgs.cargo
    pkgs.lxappearance
    pkgs.steam
    pkgs.gcc
    pkgs.gdb
    pkgs.wireguard-tools
    pkgs.neovim
    pkgs.os-prober
    pkgs.wget
    pkgs.gitFull
    pkgs.ripgrep
    pkgs.lsof
    pkgs.pulseaudioFull
    pkgs.paprefs
    pkgs.pavucontrol
    pkgs.discord
    pkgs.vlc
    pkgs.efibootmgr
    pkgs.gnumake
    pkgs.qemu
    pkgs.jq
    pkgs.qbittorrent
    pkgs.signal-desktop
    pkgs.awscli2
    pkgs.python3
    pkgs.python311Packages.pip
    pkgs.poetry
    pkgs.neofetch
  ];
}
