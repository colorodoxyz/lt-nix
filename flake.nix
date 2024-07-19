{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence";
    piss.url = "git+file:./chumbawumba";
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, impermanence, home-manager, ... }: {
    nixosConfigurations = {
      wumbo = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        # Pass inputs into the NixOS module system
        specialArgs = {
          inherit inputs;
          inherit system;
          impHPkg = impermanence.nixosModules.home-manager.impermanence;
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
          (import ./overlays.nix)
        ];
      };
    };
  };
}
