{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs {},
}:
  with pkgs;
  stdenv.mkDerivation {
    name = "clox";
    src = ./.;
    buildInputs = [ cmake ];

    installPhase = ''
    mkdir -p $out/bin
    cp src/clox $out/bin
  '';

  }
