{
  description = "Arcadia's vim configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
  };

  outputs = { nixpkgs, ... }:
  let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
    vimrc = ''
      set nonu
      set nornu
    '';
  in {/*
    apps.${system}.vim = pkgs.vim-full.customize {
      name = "arcadia-vim";
      vimrcConfig.customRC = vimrc;
    };
    */
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.vim-full.customize {
          name = "arcadia-vim";
          vimrcConfig.customRC = vimrc;
        }
      ];
      shellHook = "";
    };
  };
}
