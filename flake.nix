{
  description = "";

	nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  inputs = {
    nixpkgs = {
			url = "github:nixos/nixpkgs?ref=nixos-25.05";
			#ref = "";
		};

    nixpkgs-unstable = {
			url = "github:nixos/nixpkgs?ref=nixos-unstable";
			#ref = "nixos-unstable";
		};

    zig.url = "github:mitchellh/zig-overlay";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";

    piss.url = "git+file:/nix/persist/bonsai/chumbawumba";
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, zig, impermanence, home-manager, ... }: {
    nixosConfigurations = {
      wumbo = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        # Pass inputs into the NixOS module system
        specialArgs = {
          inherit inputs;
          inherit system;
          inherit zig;
          #impHPkg = impermanence.nixosModules.home-manager.impermanence;
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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gromit = ({...}:{
              imports = [
                ./home-manager/home.nix
                ./home-manager/hypr.nix
                ./home-manager/waybar.nix
              ];
            });
            # import ./home.nix;
          }
          #(import ./overlays.nix)
        ];
      };
    };
  };
}
