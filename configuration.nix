{ inputs, pkgs, lib, config, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./persist.nix
    ./packages.nix
  ];

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = [ "/etc/nix/path" ];

  nixpkgs.config.allowUnfree = true;

  environment = {
    variables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      DEFAULT_BROWSER = "firefox";
      TERMINAL = "kitty";
    };
    etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;


  };

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  networking = {
    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;
    useDHCP = lib.mkDefault true;
    hostName = "wumbo";
    wireless = {
      enable = true;
      networks = inputs.piss.networks;
      userControlled.enable = true;
    };
  };

  time.timeZone = "America/Los_Angeles";
  time.hardwareClockInLocalTime = true;

  # Enable sound.
  sound = {
    enable = true;
  };
  hardware.pulseaudio.enable = true;

  users.mutableUsers = false;

  users.users = {
    root.initialHashedPassword = inputs.piss.tanjoubi;
    gromit = {

      initialHashedPassword = inputs.piss.tanjoubi;
      extraGroups = [ "wheel" "docker" ];
      isNormalUser = true;
      shell = pkgs.zsh;
    };
  };

  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        gs="git status";
        gc="git commit -S";
        gd="git diff";
        gb="git branch";
        gl="git pull";
        gu="git push";
        gadd="git add";
        vim="nvim";
        gcheck="git checkout";
        la="ls -lhA";
        nxrb="sudo nixos-rebuild switch --flake /nix/persist/bonsai#wumbo";
        snu="sudo nix flake update";
        treetrim="cd /nix/persist/bonsai/";
        workup="cd /nix/persist/workspace/";
        tailup="sudo tailscale up --accept-routes";
      };
    };
    hyprland.enable = true;
  };


  # Enables copy / paste when running in a KVM with spice.
  services = {
    spice-vdagentd.enable = true;
  };
  systemd.services.restart-nm = {
    wantedBy = ["suspend.target"];
    partOf = ["suspend.target"];
    #script = "${pkgs.systemd}/bin/systemctl start NetworkManager";
  };

  virtualisation.docker.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
