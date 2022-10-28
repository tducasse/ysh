import strutils
import times
import os


# ---
# performance measures
proc measure(s: string, startTime: float) =
  var endTime = cpuTime()
  var nanoseconds = ((endTime - startTime) * 1000000000).toInt
  echo s & " took " & $(nanoseconds / 1000000) & " ms"

template track(s: string) =
  when defined perf:
    var startTime = cpuTime()
    defer: measure(s, startTime)
# ---

type
  Shell = object
    cwd: string

proc addSlash(kind: os.PathComponent): string =
  return if kind == os.pcDir: "/" else: ""

proc list(args: seq[string], shell: var Shell) =
  track("ls")
  for file in os.walkDir(".", relative = true):
    echo file.path & addSlash(file.kind)
  return

proc chdir(args: seq[string], shell: var Shell) =
  track("cd")
  if args.len < 1:
    echo "cd expects a directory"
    return
  try:
    os.setCurrentDir(args[0])
    shell.cwd = os.getCurrentDir()
    return
  except OSError as e:
    echo e.msg

proc readCommand(command: string, shell: var Shell): bool =
  var args = command.split(" ")
  case args[0]:
    of "exit":
      return true
    of "ls":
      list(args[1..args.len-1], shell)
    of "cd":
      chdir(args[1..args.len-1], shell)
    else:
      echo "command not found: " & args[0]
  return false

proc prompt (shell: var Shell): bool =
  write(stdout, "$" & os.getCurrentDir() & "> ")
  var input = readLine(stdin)
  return readCommand(input, shell)

proc main =
  var exit = false
  var cwd = os.getCurrentDir()
  var shell = Shell(cwd: cwd)
  while not exit:
    exit = prompt(shell)
    write(stdout, "\n")

main()
