{
  description = "";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-26.05";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    rustlings-nix = {
      url = "github:colorodoxyz/rustlings-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cc = {
      url = "github:ryoppippi/nix-claude-code";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    piss.url = "git+file:/nix/persist/bonsai/chumbawumba";
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-unstable,
    rustlings-nix,
    impermanence,
    home-manager,
    cc,
    ...
  }: {
    nixosConfigurations = {
      wumbo = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs system;

          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };

        modules = [
          impermanence.nixosModules.impermanence
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "hm-backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.gromit = {...}: {
                imports = [
                  ./home-manager/home.nix
                  ./home-manager/waybar.nix
                ];
              };
            };
            # import ./home.nix;
          }
          (import ./overlays.nix {
            inherit cc rustlings-nix;
            inherit (specialArgs) pkgs-unstable;
          })
        ];
      };
    };
  };
}
