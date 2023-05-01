{
  description = "A very basic flake";
  
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    local = { url = "localhost:9999"; };
  };

  outputs = { self, nixpkgs, local }:
  let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        local.rails-experiment
      ];
      shell = ''
        echo "We did it!"
      '';
    };
  };
}
