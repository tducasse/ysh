# ysh

A custom unix shell, written in multiple languages.

## Add another language
- run `make language=YOUR_LANGUAGE`
- go to `./implementations/YOUR_LANGUAGE`
- write your implementation according to the specification
- make sure you add build/run instructions to `./implementations/YOUR_LANGUAGE/README.md`


## Specification
- cross-platform (Linux, Windows, Mac)
- input loop:
  - prompts the user with `> ` and waits for an input
  - executes the command `CMD` or says `command not found: CMD`
  - prints the results if any, then prompt the user again
- built-in commands:
  - `ls`
  - `cd`


## Available implementations
- [go](implementations/go)
[//]: # ""