{
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/systemd/coredump"
      "/var/lib/bluetooth"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      # machine-id is used by systemd for the journal, if you don't persist this
      # file you won't be able to easily use journalctl to look at journals for
      # previous boots.
      "/etc/machine-id"
    ];
    users.gromit = {
      directories = [
        ".local/share/kscreen"
	    ".local/share/kwalletd"
        ".local/share/sddm"
        ".local/share/zoxide"
        ".local/share/Steam"
        ".local/share/nvim"

        ".config/kitty"
        ".config/nvim"
        ".config/element"
        ".config/slack"
        ".config/Signal"
        ".config/discord"
        ".config/darktable"
        ".config/spotify-player"
        ".cache/spotify-player"

        ".mozilla"

        ".ssh"
        "go"
        "processing"
        "photoJpgs"
        "Downloads"
      ];
      files = [
        ".bash_history"
        ".config/systemsettingsrc"
        ".zsh_history"
      ];
    };
  };
}
