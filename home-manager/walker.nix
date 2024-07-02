{config, pkgs, inputs, ...}:
{
    programs.walker = {
        enable = true;
        runAsService = true;

        config = {
            placeholder = "Search";
            fullscreen = false;
            list = {
                height = 200;
            };
            modules = [
                {
                    "name" = "runner";
                    "prefix" = "";
                }
                {
                    "name" = "applications";
                    "prefix" = "";
                }
                {
                    "name" = "ssh";
                    "prefix" = "";
                    "switcher_exclusive" = true;
                }
                {
                    "name" = "finder";
                    "prefix" = "";
                    "switcher_exclusive" = true;
                }
                {
                    "name" = "commands";
                    "prefix" = "";
                    "switcher_exclusive" = true;
                }
                {
                    "name" = "websearch";
                    "prefix" = "?";
                }
                {
                    "name" = "switcher";
                    "prefix" = "/";
                }
            ];
        };
        style = ''
        * {
        color: #111111;
        }
        '';
    };
}

