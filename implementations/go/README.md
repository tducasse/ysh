# ysh-go

The `ysh` shell, implemented in `go`.

## How to build
- `go get` to download dependencies
- `go build` to compile and create `ysh-go` in the current directory, then run `./ysh-go`
- `go install` to compile and install `ysh-go` in your `$GOPATH/bin` folder (find it with `go env GOPATH`, and add it to your PATH), then run `ysh-go` from anywhere

## Measure performance
- `go run . -perf` to print timing logs