# ysh-rust

The `ysh` shell, implemented in `rust`.

## How to build
- `cargo build` then `./target/debug/ysh-rust` for the debug version
- `cargo build -r` then `./target/release/ysh-rust` for the release version
- `cargo run` or `cargo run -r` to run in debug or release mode


## Measure performance
- `cargo build --features "perf"` then `./target/debug/ysh-rust` for the debug version with timing metrics
- `cargo build -r --features "perf"` then `./target/release/ysh-rust` for the release version with timing metrics
- `cargo run --features "perf"` or `cargo run -r --features "perf"` to run in debug or release mode with timing metrics