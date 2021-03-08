{
  description = "clox";
  # Provides abstraction to boiler-code when specifying multi-platform outputs.
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = with pkgs; mkShell {
          buildInputs = [ cmake ];
        };
        defaultPackage = with pkgs; stdenv.mkDerivation {
          name = "clox";
          src = self;
          buildInputs = [ cmake ];
          installPhase = ''
            mkdir -p $out/bin
            cp src/clox $out/bin
          '';
        };
      });
}
