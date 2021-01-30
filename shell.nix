{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs {}
}:
  with pkgs;
  stdenv.mkDerivation {
    name = "clox";
    buildInputs = [];
  }
