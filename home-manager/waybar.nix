{...}:
{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                height = 30;
                spacing = 4;
                modules-left = [
                    "hyprland/workspaces"
                ];
                modules-right = [
                    "memory"
                    "cpu"
                    "temperature"
                    "wireplumber"
                    "network"
                    "battery"
                    "clock#date"
                    "clock"
                ];
                network = {
                    "format-wifi" = "{essid} ({signalStrength}%) ";
                    "format-ethernet" = "{ipaddr}/{cidr} ";
                    "tooltip-format" = "{ifname} via {gwaddr} ";
                    "format-linked" = "{ifname} (No IP) ";
                    "format-disconnected" = "Disconnected ⚠";
                    "format-alt" = "{ifname}: {ipaddr}/{cidr}";
                };
                "clock#date" = {
                    "format" = "{:%m/%d/%y}";
                };
                "hyprland/workspaces" = {
                    "format" = "{icon}{name}{icon}";
                    "format-icons" = {
                        "default" = "";
                        "active" = "*";
                    };
                };
                "temperature" = {
                  "hwmon-path-abs" = "/sys/devices/platform/thinkpad_hwmon/hwmon/hwmon5/temp1_input";
                  #"format" = "";
                };

                "battery" = {
                    "states" = {
                        "warning" = 30;
                        "critical" = 15;
                    };
                    "format" = "{capacity}% {icon}";
                    "format-full" = "{capacity}% {icon}";
                    "format-charging" = "{capacity}% ";
                    "format-plugged" = "{capacity}% ";
                    "format-alt" = "{time} {icon}";
                    "format-icons" = ["" "" "" "" ""];
                };

                /*"pulseaudio" = {
                    "format" = "{volume}% {icon} {format_source}";
                    "format-muted" = " {format_source}";
                    "format-source" = "{volume}% ";
                    "format-source-muted" = "";
                    "format-icons" = {
                        "headphone" = "";
                        "hands-free" = "";
                        "headset" = "";
                        "phone" = "";
                        "portable" = "";
                        "car" = "";
                        "default" = ["" "" ""];
                    };
                };*/

                "cpu" = {
                    "interval" = 2;
                    "format" = "{usage}% ";
                };

                "memory" = {
                    "interval" = 30;
                    "format" = "{used:0.1f}G/{total:0.1f}G ";
                };

                "wireplumber" = {
                    "format" = "{volume}% {icon}";
                    "format-muted" = "";
                    "format-bluetooth" = "{volume}% {icon} {format_source}";
                    "format-bluetooth-muted" = " {icon} {format_source}";
                    "on-click" = "pavucontrol";
                    "format-icons" = ["" "" ""];
                };
            };
        };
    };
}

