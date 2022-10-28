import { lstatSync } from "fs";
import { readdir } from "fs/promises";
import path from "path";
import rl from "readline";

const readline = rl.promises.createInterface({
  input: process.stdin,
  output: process.stdout,
});

let startTime;

class Shell {
  constructor(cwd) {
    this.cwd = cwd;
  }
}

const main = async () => {
  let exit = false;
  const cwd = process.cwd();
  const shell = new Shell(cwd);

  while (!exit) {
    exit = await prompt(shell);
    console.log("");
  }
  process.exit();
};

const prompt = async (shell) => {
  const command = await readline.question("$" + shell.cwd + "> ");
  return readCommand(command, shell);
};

const readCommand = async (command, shell) => {
  const args = command.split(" ");
  switch (args[0]) {
    case "exit":
      return true;
    case "ls":
      await list(args.slice(1), shell);
      break;
    case "cd":
      chdir(args.slice(1), shell);
      break;
    default:
      console.log("command not found: " + args[0]);
      break;
  }
  return false;
};

const addSlash = (file, dir) =>
  lstatSync(path.resolve(dir, file)).isDirectory() ? "/" : "";

const list = async (args, shell) => {
  if (process.env.PERF) {
    startTime = performance.now();
  }
  try {
    const files = await readdir(shell.cwd);
    files.forEach(async (file) => {
      console.log(file + addSlash(file, shell.cwd));
    });
  } catch (err) {
    console.log("Cannot read from " + shell.cwd);
    return;
  } finally {
    if (process.env.PERF) {
      console.log("ls took " + (performance.now() - startTime) + " ms");
    }
  }
};

const chdir = (args, shell) => {
  if (process.env.PERF) {
    startTime = performance.now();
  }
  if (!args.length) {
    console.log("cd expects a directory");
    return;
  }
  try {
    process.chdir(args[0]);
    shell.cwd = process.cwd();
  } catch (err) {
    console.log("Cannot change directory to " + args[0]);
  } finally {
    if (process.env.PERF) {
      console.log("cd took " + (performance.now() - startTime) + " ms");
    }
  }
};

main();
