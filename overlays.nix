{ pkgs, lib, ... }: {
  nixpkgs.overlays = [
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
  ];

}
