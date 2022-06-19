![COLOR CTF](logo/logo.svg)

## About

> TO BE DONE

## Prerequisites

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads). This software is needed to create virtual machines.
2. Install [Vagrant](https://www.vagrantup.com/downloads). This software is used to manage the virtual machines.
3. Clone this Git repository into a folder of your choice.

## Getting started

1. Select a machine from [this list below](#machines), for example `aqua`.
2. Open a terminal in the repository folder and run the following command:
```bash
# On Linux
./color-ctf.bash start <machine>
# On Windows
./color-ctf.cmd start <machine>
```
The creation of the virtual machine might take some minutes. You might want to take a quick break right now.

3. When the machine is up and running, the script will print the local IP address of the machine.
4. That's it! You can now start scanning the host for vulnerabilities. Happy hacking!

## Command reference
- Run a command on Linux: `./color-ctf.bash <command>`
- Run a command on Windows: `./color-ctf.cmd <command>`

**Command list:**

| Command | Explanation |
| --- | --- |
| `status` | List all machines, their status and IP addresses |
| `start <machine>` | Start a machine |
| `stop <machine>` | Stop a running machine |
| `reset <machine>` | Reset a machine to its initial state |

## Machines

| | Machine name | Difficulty |
| --- | --- | --- |
| ![aqua](logo/icons/aqua.png) | aqua | easy |

