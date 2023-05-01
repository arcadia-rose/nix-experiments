{
  description = "A very basic flake";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
  };

  outputs = { self, nixpkgs }:
  let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.rails-experiment =
      with import nixpkgs { inherit system; };
        stdenv.mkDerivation {
          inherit system;
          name = "rails-experiment";
          src = ./.;
          buildInputs = [
            pkgs.ruby_3_2
            pkgs.bundler
          ];
          buildPhase = ''
            export PATH=$out/bin:$PATH
            export GEM_HOME=$out
            bundle install
          '';
        };
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.ruby_3_2
        pkgs.bundler
      ];
      shellHook = ''
        export PATH=$out/bin:$PATH
        export GEM_HOME=$out
        bundle install
        echo "Done"
      '';
    };
  };
}
