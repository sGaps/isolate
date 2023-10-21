# Isolate: a toy-like environment to compile C projects

Simple enviroment that lets you compile programs
written in C.

This utility copies the file or directory provided
on the CLI and put it in a place to compile or debug
the target file/project.

This was made to test the programs designed by students
from a course of Programming Fundamentals.

## Contents

- [Isolate: a toy-like environment to compile C projects](#isolate-a-toy-like-environment-to-compile-c-projects)
  - [Contents](#contents)
  - [How to Install](#how-to-install)
  - [How to use](#how-to-use)
  - [Requirements](#requirements)
  - [TO DO](#to-do)


## How to Install

1. Clone this repository

```bash
git clone git@github.com:sGaps/isolate.git
```

2. Open your local copy of the repository

```bash
cd isolate
```

3. Use the install script (per-user installation)

```bash
./install.sh
```

And that's all.

## How to use

In your terminal, write the following command

```bash
isolate
```

It will show something like this

```
Usage:
    run-isolate [FILE]
Description:
    Command that lets you run gcc and gdb into an isolated environment with capped results
```


## Requirements

- Docker.
- Linux.

> Note that linux is required because we use 'tmpfs' mounts and
> the installation and program script were written in bash.

## TO DO

- [ ] Create a new user instead of using 'root' as default.
- [ ] Create an easy way to debug C programs.
- [ ] Simplify the installation process.
- [ ] Unmount /mnt/external after initializing the container.

