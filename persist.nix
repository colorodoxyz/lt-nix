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
        ".config/syncthing"
        ".config/keepassxc"
        ".cache/spotify-player"
        ".cache/keepassxc"

        ".mozilla"

        ".ssh"
        "go"
        "processing"
        "photoJpgs"
        "screenshots"
        "Downloads"
        "Documents"
        "Sync"
        "manual-connections"
      ];
      files = [
        ".bash_history"
        ".config/systemsettingsrc"
        ".zsh_history"
      ];
    };
  };
}
