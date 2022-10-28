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
  - `ls` without params
  - `cd PATH`
- the executable is called `ysh-YOUR_LANGUAGE` to avoid name collisions

## Goals
- cd
- ls
- mv
- cp
- rm
- touch
- cat
- edit (text editor)
- ...

## Available implementations
[//]: # ""
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
