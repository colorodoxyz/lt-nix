{ zig, pkgs, pkgs-unstable, ... }:
{

  fonts.packages = with pkgs; [
    fira-mono
    hack-font
    inconsolata
    iosevka
    font-awesome
  ];

  environment.systemPackages = [
    pkgs.xwayland
    pkgs.swaybg
    pkgs.waybar
    pkgs.glxinfo
    pkgs.brightnessctl
    pkgs.hypridle
    pkgs.hyprshot

    pkgs.wpa_supplicant_gui

    zig.packages."x86_64-linux".master

    pkgs.wofi
    pkgs.gtk3

    pkgs.chromium
    pkgs.vulkan-tools
    pkgs.mako
    pkgs.orca-slicer

    pkgs.wl-clipboard
    pkgs.wl-clip-persist
    pkgs.clipse

    pkgs.blueman
    pkgs.wev

    pkgs.vscode

    pkgs.halloy
    pkgs.wineWow64Packages.full
    pkgs.unrar

    pkgs.remarkable-mouse
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
    pkgs.gzip
    pkgs.nodejs
    pkgs.gotop
    pkgs.libreoffice
    pkgs.tmate
    pkgs.tailscale
    pkgs.firefox
    pkgs-unstable.spotify-player
    pkgs.go

    pkgs-unstable.rustc
    pkgs-unstable.clippy
    pkgs-unstable.cargo

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
    pkgs.signal-desktop
    pkgs.awscli2
    pkgs.python3
    pkgs.python311Packages.pip
    pkgs.poetry
    pkgs.neofetch
  ];
}
