{ pkgs, ... }: {
  home = {
    username = "gromit";
    homeDirectory = "/home/gromit";
    packages = with pkgs; [
      nurl
      xclip
      tree
      ripgrep
    ];
    file.".ssh/allowed_signers".text = ''
    spencer.liu.liu@gmail.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFYOC0HTedqrgULQ7WOhqwQ7OCapQk+q4ZLOE4knjSkW
    '';
  };

  services.wlsunset = {
    enable = true;
    latitude = 37.5;
    longitude = 121.9;
  };

  programs = {
    home-manager.enable = true;

    firefox.enable = true;

    kitty = {
	enable = true;
	#theme = "Argonaut";
	#extraConfig = (builtins.readFile ./kitty.conf);
	#background_image = "/home/colorodo/th-1524566410.jpg";
    };

    git = {
      enable = true;
      lfs.enable = true;
      userName = "Spencer Liu";
      userEmail = "spencer.liu.liu@gmail.com";
      extraConfig = {
        #url."git@github.com:".insteadOf = "https://github.com/";
        #url."git@gogs.tail43567.ts.net".insteadOf = "http://gogs.tail43567.ts.net";
        gpg = {
          format = "ssh";
          ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        };
        user.signingkey = "/home/gromit/.ssh/gh_sign.pub";
        commit.gpgsign = true;
      };
    };

    fzf.enable = true; # enables zsh integration by default
    starship.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
    };

    neovim.enable = true;

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  services.mako = {
      enable = true;
      defaultTimeout = 5000;
  };


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
