{pkgs, ...}: {
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
    sessionPath = ["~/.cargo/bin"];
  };

  services = {
    wlsunset = {
      enable = true;
      latitude = 37.5;
      longitude = -121.9;
      temperature = {
        night = 3000;
      };
      systemdTarget = "hyprland-session.target";
    };

    hypridle = {
      enable = true;
      settings = {
        general = {
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "pidof hyprlock || hyprlock";
        };

        listener = [
          {
            timeout = 150;
            on-timeout = "brightnessctl -s set 0";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 1800;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };

    blueman-applet = {
      enable = true;
    };
  };

  programs = {
    home-manager.enable = true;
    hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          ignore_empty_input = true;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [
          {
            path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
          }
        ];

        input-field = [
          {
            size = "200, 50";
            position = "0, -80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(202, 211, 245)";
            inner_color = "rgb(91, 96, 120)";
            outer_color = "rgb(24, 25, 38)";
            outline_thickness = 5;
            placeholder_text = "\'Password...\'";
            shadow_passes = 2;
          }
        ];
      };
    };

    bemenu.enable = true;

    firefox.enable = true;

    kitty = {
      enable = true;
      themeFile = "Argonaut";
      #extraConfig = (builtins.readFile ./kitty.conf);
    };

    git = {
      enable = true;
      lfs.enable = true;

      settings = {
        user = {
          name = "Spencer Liu";
          email = "spencer.liu.liu@gmail.com";
          signingkey = "/home/gromit/.ssh/gh_sign.pub";
        };
        gpg = {
          format = "ssh";
          ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        };
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
    jujutsu = {
      enable = true;
      settings = {
        user = {
          email = "spencer.liu.liu@gmail.com";
          name = "Spencer Liu";
        };
        signing = {
          behavior = "own";
          backend = "ssh";
          key = "/home/gromit/.ssh/gh_sign.pub";
          backends.ssh.allowed-signers = "/home/gromit/.ssh/allowed_signers";
        };
      };
    };

    neovim = {
      enable = true;
      sideloadInitLua = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
