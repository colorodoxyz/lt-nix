{
  cc,
  rustlings-nix,
  pkgs-unstable,
  ...
}: {
  nixpkgs.overlays = [
    cc.overlays.default
    rustlings-nix.overlays.default
    (final: prev: {
      spotify-player = pkgs-unstable.spotify-player.overrideAttrs {
        version = "0.25.1-unstable-157e6a8";
        src = final.fetchFromGitHub {
          owner = "geetarOS";
          repo = "spotify-player";
          rev = "157e6a8fe8365361738ee794679f0392ac75d1ce"; # branch fix-ncspot-redirect-uri
          hash = "sha256-TeZp7pdc83zowbcc2ab5fbVOz0PT4mKedIqOjSGYa6Q=";
        };
        cargoHash = "sha256-RsUuPkX4oVG6mDM16mM7VGW22mvKZPjShqs8BO36hbY=";
      };
    })
  ];
}
