{ config, impHPkg, lib, zig, pkgs, pkgs-unstable, ... }:

{
  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    DEFAULT_BROWSER = "firefox";
    TERMINAL = "kitty";
  };


  #environment.etc."current-system-packages".text =

  /*
  let
     packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
     sortedUnique = builtins.sort builtins.lessThan (lib.unique packages);
     formatted = builtins.concatStringsSep "\n" sortedUnique;
  in
    formatted;
  */

  # List packages installed in system profile. To search, run:
  # $ nix search wget
}
