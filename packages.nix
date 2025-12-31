{ zig, pkgs, pkgs-unstable, ... }:
{

  fonts.packages = with pkgs; [
    fira-mono
    hack-font
    inconsolata
    iosevka
    font-awesome
  ];

  environment.systemPackages = with pkgs; [
    xwayland
    swaybg
    waybar
		#glxinfo
		mesa-demos
		filezilla
    brightnessctl
    hypridle
    hyprshot

    wpa_supplicant_gui

    zig.packages."x86_64-linux".master

    wofi
    gtk3

		kdePackages.dolphin
    chromium
    vulkan-tools
    mako
		pkgs-unstable.orca-slicer

    wl-clipboard
    wl-clip-persist
    clipse

    blueman
    wev

		nix-tree

    halloy
    wineWow64Packages.full
    unrar

    remarkable-mouse
    parallel
    dnglab
    darktable
    ranger
    element-desktop
    xournalpp
    s5cmd
    rclone
    tor-browser
    ranger
    keepassxc
    gzip
    nodejs
    gotop
    libreoffice
    tmate
    tailscale
    firefox
    spotify-player
    go

    rustc
    clippy
    cargo
		helvum

    lxappearance
    steam
    gcc
    gdb
    wireguard-tools
    neovim
    os-prober
    wget
    gitFull
    ripgrep
    lsof
    paprefs
    discord
    vlc
    efibootmgr
    gnumake
    qemu
    jq
    signal-desktop
    awscli2
    python3
    python311Packages.pip
    poetry
    neofetch
    unzip
  ];
}
