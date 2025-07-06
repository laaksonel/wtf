{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:

    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        hPkgs = pkgs.haskellPackages.override {
          overrides = hself: hsuper: { scotty = hsuper.scotty_0_22; };
        };
        ci = pkgs.haskell.lib.dontCheck (hPkgs.callCabal2nix "haskell-stuff" ./. { });
      in
      {
        packages.default = ci;

        devShells = rec {
          haskell = pkgs.mkShell {
            name = "haskell-shell";
            buildInputs =
              with hPkgs;
              [
                haskell-language-server
                cabal-install
                fourmolu
                ghcid
                cabal-fmt
                hoogle
                cabal-gild
              ]
              ++ (with pkgs; [
                just
                zlib
                nodejs_20
                python3
                cargo
              ]);
          };
          default = haskell;
        };
      }
    );
}
