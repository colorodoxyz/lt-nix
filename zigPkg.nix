{stdenv, fetchurl}:
stdenv.mkDerivation (finalAttrs:{
  name = "zig";
  src = fetchurl {
    url = "https://ziglang.org/builds/zig-0.14.0-dev.224+95d9292a7.tar.xz";
    hash = "sha256-wPJ4RNh03HvUqZ/8CbYrXysncw7A1ZD9h7W7j+2RlHg=";
  };
})
