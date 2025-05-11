{ pkgs, lib, ... }: {
  nixpkgs.overlays = [
  /*
    (final: prev: {
      dnglab = prev.dnglab.override {
        rustPlatform = prev.rustPlatform // {
          buildRustPackage = args: prev.rustPlatform.buildRustPackage (args // {
            pname = "dnglab";
            version = "0.6.2";

            src = prev.fetchFromGitHub {
              owner = "dnglab";
              repo = "dnglab";
              rev = "v0.6.2";
              sha256 = "sha256-GMpLvD6ueelBVBDxg33HqZ97gpXZ4sV2dGiOILPbaQA=";
            };
            cargoSha256 = "sha256-jIHYwIjhEbDW+c0R3dT1LZjmJrBDUTrB848hYAhDpWk=";
          });
        };
      };
    })
    */

    (final: prev: {
      spotify-player = prev.spotify-player.override {
        rustPlatform = prev.rustPlatform // {
          buildRustPackage = args: prev.rustPlatform.buildRustPackage (args // {
            pname = "spotify-player";
            version = "0.20.4";

            src = prev.fetchFromGitHub {
              owner = "aome510";
              repo = "spotify-player";
              rev = "refs/tags/v0.20.4";
              sha256 = "sha256-SKlESIw8eAyAqR1HVW004yyL2nNVEnb4/xmf0ch3ZMo=";
            };
            cargoHash = "sha256-VlJ8Bz4EY2rERyOn6ifC7JAL5Mvjt0ZOzlPBOwiH6WA=";
          });
        };
      };
    })

    /*
    (final: prev: {
      discord = prev.discord.override {
        pname = "discord";
        version = "0.0.60";

        src = prev.fetchurl {
          url = "https://dl.discordapp.net/apps/linux/0.0.60/discord-0.0.60.tar.gz";
          hash = "sha256-hu1+/z/ZtHoobjHF+pgNm040r4LQJUTnpZ06RNERFr8=";
        };
      };
    })
    */
  ];
}
