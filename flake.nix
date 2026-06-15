{
  description = "";

  inputs = {
    nixpkgs = {
			url = "github:nixos/nixpkgs?ref=nixos-26.05";
		};

    nixpkgs-unstable = {
			url = "github:nixos/nixpkgs?ref=nixos-unstable";
		};

    zig = {
			url = "github:mitchellh/zig-overlay";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
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
            home-manager = {
							backupFileExtension = "hm-backup";
							useGlobalPkgs = true;
							useUserPackages = true;
							users.gromit = ({...}:{
								imports = [
									./home-manager/home.nix
									./home-manager/hypr.nix
									./home-manager/waybar.nix
								];
							});
					};	
            # import ./home.nix;
          }
          #(import ./overlays.nix)
        ];
      };
    };
  };
}
