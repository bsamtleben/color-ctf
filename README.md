![COLOR CTF](logo/logo.svg)

## About

You would like to solve capture-the-flag challenges and don't know where to start? If that's the case, Color CTF might be something for you!

We've assembled a collection of vulnerable Linux machines that you can try to get into. The task is always the same: Find the two tokens hidden inside the machine. To retrieve them, you will have to identify and exploit vulnerabilities until you finally gain root access.

In other words: *It's just a typical CTF, isn't it?* Well, not completely! Here are some points that might convince you:

**Self-contained and simple:** Manage everything in just a few steps: One command to start your preconfigured Kali Linux attacker machine... a second command to boot up a target machine... that's it! You can already start scanning for vulnerabilities!

**Beginner-friendly challenges:** We've got various machines in rising levels of difficulty. Can you solve them all?

**Cross-platform:** The setup works on Windows and Linux, so you can stay on you favorite operating system!

Sound's interesting? Well, then just put on your hoodie and get started! Happy hacking!

## Prerequisites

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads). This software is needed to create virtual machines.
2. Install [Vagrant](https://www.vagrantup.com/downloads). This software is used to manage the virtual machines.
3. Install [Python 3](https://www.python.org/downloads/). Make sure that you can execute `python` or `python3` in your terminal.
4. Clone this Git repository into a folder of your choice.

## Getting started

1. **Start your Kali Linux attack machine**
   1. Open a terminal in the repository folder and run the following command:
      ```bash
      python3 color-ctf start kali
      ```
   2. The creation of the virtual machine will take several minutes. This is the right moment to take a quick break.
   3. As soon as the setup script is finished, you can log into the machine with the provided credentials.
2. **Start a vulnerable machine that you want to attack**
   1. Pick a machine from [the list below](#machines), for example `aqua`.
   2. Run the following command in your terminal:
      ```bash
      python3 color-ctf start <machine>
      ```
   3. As soon as the machine is up and running, the script will provide you with the local IP address.
3. **That's it!**
   You can now use your Kali Linux machine to start scanning for vulnerabilities. Happy hacking!

> When you're done, make sure to stop both machines via `python3 color-ctf stop <machine>`.

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

Nevertheless, if a machine cannot be started or stopped and the error message is not helpful, you can check the log file stored at `machines/vagrant.log`. Just be aware that it might contain spoilers.

## Machines

| | Machine name | Difficulty | Remarks |
| --- | --- | --- | --- |
|  | kali | - | Kali Linux attack machine |
| ![aqua](logo/icons/aqua.svg) | aqua | easy | |
| ![emerald](logo/icons/emerald.svg) | emerald | easy | |

---

> **Disclaimer:** The challenges and demonstrated techniques are intended for educational purposes only. The author does not endorse any illegal actions.
