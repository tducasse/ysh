use std::{
    env, fs,
    io::{self, Write},
    time::Instant,
};

struct Shell {
    cwd: String,
}

fn main() {
    let mut exit = false;
    let cwd = env::current_dir().unwrap().as_path().display().to_string();
    let mut shell = Shell { cwd };
    while !exit {
        exit = prompt(&mut shell);
        println!("");
    }
}

fn prompt(shell: &mut Shell) -> bool {
    print!("${}> ", shell.cwd);
    io::stdout().flush().unwrap();
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Failed to read command");
    return read_command(&input, shell);
}

fn read_command(command: &String, shell: &mut Shell) -> bool {
    let args: Vec<&str> = command.split(" ").map(|x| x.trim()).collect();
    match args[0] {
        "exit" => return true,
        "ls" => list(args, shell),
        "cd" => chdir(args, shell),
        _ => {
            print!("command not found: {}", args[0]);
        }
    }
    return false;
}

fn print_time(_instant: Instant) {
    #[cfg(feature = "perf")]
    {
        print!("ls took {:?} ms", _instant.elapsed().as_secs_f32() * 1000.0);
    }
}

fn chdir(args: Vec<&str>, shell: &mut Shell) {
    let instant = Instant::now();
    if !(args.len() > 1) {
        print!("cd expects a directory");
        return;
    }
    match env::set_current_dir(args[1]) {
        Err(_) => print!("Cannot change directory to {}", args[1]),
        _ => (),
    }
    shell.cwd = env::current_dir().unwrap().as_path().display().to_string();
    print_time(instant);
}

fn list(_args: Vec<&str>, shell: &Shell) {
    let instant = Instant::now();
    let paths = fs::read_dir(&shell.cwd).unwrap();

    for path in paths {
        let mut slash = "";
        let file = path.unwrap();
        if file.metadata().unwrap().is_dir() {
            slash = "/";
        }
        println!("{}{}", file.file_name().to_str().unwrap(), slash)
    }
    print_time(instant);
}
