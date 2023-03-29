with (import <nixpkgs> {});

derivation {
  name = "hello";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  system = builtins.currentSystem;

  inherit coreutils cargo gcc;
  src = ./.;
}
