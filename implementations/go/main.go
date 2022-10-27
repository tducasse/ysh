package main

import (
	"bufio"
	"fmt"
	"io/fs"
	"os"
	"strings"
)

type Shell struct {
	cwd string
}

func main() {
	exit := false
	cwd, _ := os.Getwd()
	shell := &Shell{
		cwd: cwd,
	}
	for !exit {
		exit = prompt(shell)
		fmt.Println()
	}
}

func prompt(shell *Shell) bool {
	fmt.Print("$" + shell.cwd + "> ")
	input := bufio.NewScanner(os.Stdin)
	input.Scan()
	return readCommand(input.Text(), shell)
}

func readCommand(command string, shell *Shell) bool {
	args := strings.Split(command, " ")
	switch args[0] {
	case "exit":
		return true
	case "ls":
		list(args[1:], shell)
	case "cd":
		chdir(args[1:], shell)
	default:
		fmt.Println("command not found: " + args[0])
	}
	return false
}

func chdir(args []string, shell *Shell) {
	if len(args) < 1 {
		fmt.Println("cd expects a directory")
		return
	}
	err := os.Chdir(args[0])
	shell.cwd, _ = os.Getwd()
	if err != nil {
		fmt.Println("Cannot change directory to " + args[0])
	}
}

func addSlash(file fs.DirEntry) string {
	if file.IsDir() {
		return "/"
	}
	return ""
}

func list(args []string, shell *Shell) {
	files, err := os.ReadDir(shell.cwd)
	if err != nil {
		fmt.Println("Cannot read from " + shell.cwd)
		return
	}
	for _, file := range files {
		fmt.Println(file.Name() + addSlash(file))
	}
}
