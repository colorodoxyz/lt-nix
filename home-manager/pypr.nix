{pkgs, ... }:
{

  pkgs: {
    top = "${pkgs.btop}/bin/btop";
    term = "${pkgs.foot}/bin/foot";
    text-editor = "${pkgs.foot}/bin/neovide";
    file-manager-cli = "${pkgs.yazi}/bin/yazi";
    browser = "${pkgs.firefox-wayland}/bin/firefox";
    color-picker = "${pkgs.hyprpicker}/bin/hyprpicker";
    audio-control = "${pkgs.pavucontrol}/bin/pavucontrol";
  }
  xdg.configFile."hypr/pyprland.toml".text = ''
  [pyprland]
  plugins = [ "scratchpads", "magnify", "layout_center" ]

  [scratchpads.term]
  lazy = false
  size = "38% 40%" # width height
  command = "${term}"
  animation = "fromBottom"
  '';
}

