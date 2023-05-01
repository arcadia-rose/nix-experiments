export PATH="$coreutils/bin:$clang/bin:$bintools/bin:$cargo/bin"
cd $src
mkdir $out
cargo build --release --target-dir $TEMP
mv $TEMP/release/hello $out/hello
