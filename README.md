![COLOR CTF](logo/logo.svg)

## About

> TO BE DONE

## Prerequisites

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads). This software is needed to create virtual machines.
2. Install [Vagrant](https://www.vagrantup.com/downloads). This software is used to manage the virtual machines.
3. Install [Python 3](https://www.python.org/downloads/). Make sure that you can execute `python` or `python3` in your terminal.
4. Clone this Git repository into a folder of your choice.

## Getting started

1. Pick a machine from [this list below](#machines), for example `aqua`.
2. Open a terminal in the repository folder and run the following command:
```bash
python3 color-ctf start <machine>
```
The creation of the virtual machine will take several minutes. This is the right moment to take a quick break.

3. As soon as the machine is up and running, the script will print the local IP address of the machine.
4. That's it! You can now start scanning the host for vulnerabilities. Happy hacking!

> When you're done, make sure to stop the machine via `python3 color-ctf stop <machine>`.

## Command reference

Run a command: `python3 color-ctf <command>`

**Command list:**

| Command | Explanation |
| --- | --- |
| `status` | List all machines, their status and IP address |
| `start <machine>` | Start a machine |
| `stop <machine>` | Stop a running machine |
| `reset <machine>` | Reset a machine to its initial state |

## Troubleshooting

**Spoiler alert:** There is no debug output when the virtual machines are provisioned since this would provide a lot of information about the setup of the machines and could reveal how to solve them.

Nevertheless, if a machine cannot be started or stopped and the error message is not helpful, you can check the log file stored at `machines/vagrant.log`. Just be aware that it *might* contain spoilers.

## Machines

**Attacking machine:** `kali`

**Vulnerable machines:**
| | Machine name | Difficulty |
| --- | --- | --- |
| ![aqua](logo/icons/aqua.svg) | `aqua` | easy |

