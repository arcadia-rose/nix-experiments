with (import <nixpkgs> {});

mkShell {
  name = "hello";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  system = builtins.currentSystem;

  inherit coreutils cargo clang;
  bintools = clang.bintools.bintools_bin;
  src = ./.;
}
