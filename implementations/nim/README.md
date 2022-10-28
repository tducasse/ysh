# ysh-nim

The `ysh` shell, implemented in `nim`.

## How to build
- `nimble build` then `./yshnim`
- `nimble install` then `yshnim` if you added `$HOME/.nimble/bin` to your PATH

## Measure performance
- `nim c -r -d:perf src/yshnim.nim` to print timing logs