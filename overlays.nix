{ cc, ... }: {
  nixpkgs.overlays = [
    cc.overlays.default

  ];
}
