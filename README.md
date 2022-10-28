# ysh

A custom unix shell, written in multiple languages.

## Add another language
- run `make language=YOUR_LANGUAGE`
- go to `./implementations/YOUR_LANGUAGE`
- write your implementation according to the specification
- make sure you add build/run instructions to `./implementations/YOUR_LANGUAGE/README.md`


## Specification
- cross-platform (Linux, Windows, Mac)
- the executable is called `ysh-YOUR_LANGUAGE` to avoid name collisions
- built-in commands

## Built-in 
- [x] cd
- [x] ls
  - [x] without params
  - [ ] with params
- [ ] mv
- [ ] cp
- [ ] rm
- [ ] touch
- [ ] cat
- [ ] edit (text editor)
- ...

## Available implementations
[//]: # ""
- [rust](implementations/rust)
- [js](implementations/js)
- [nim](implementations/nim)
- [go](implementations/go)

## A few other languages on my list
- c#
- rust
- python
- ruby
- swift
- lua
