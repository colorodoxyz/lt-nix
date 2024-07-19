{
  pkgs.stdenv.mkDerivation {
    name = "zig";
    src = pkgs.fetchurl {
      url = "https://ziglang.org/builds/zig-0.14.0-dev.224+95d9292a7.tar.xz";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
  }
}
