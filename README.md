![COLOR CTF](logo/logo.svg)

**An educational CTF environment with interesting challenges**

## About

You would like to solve capture-the-flag challenges and don't know where to start? In that case, Color CTF might be something for you!

We've assembled a collection of vulnerable Linux machines that you can try to take over. The task is always the same: Retrieve the two tokens hidden on the machine. To find them, you will have to identify and exploit vulnerabilities until you finally gain root access.

*So it's just a normal CTF?* - Well, not completely! Here are some points that might convince you:

- **Self-contained and simple:** Everything is automated to make things as easy as possible: One command to start your preconfigured Kali Linux attacker machine... a second command to boot up your target machine... that's it! You can already start scanning for vulnerabilities!

- **Beginner-friendly:** There are various machines in rising levels of difficulty. You can start with simple vulnerabilities.

- **Unique challenges:** Our challenges are handcrafted and as unique as they could be!

- **Transparency:** Every machine setup is fully transparent and open-source.

- **Hints & walkthroughs:** As Color CTF is intended for educational purposes, there are walkthroughs and hints available for all CTF machines. Feel free to check them out [here](https://github.com/bsamtleben/color-ctf-walkthroughs) if you get stuck!

Sounds interesting? Well, then just put on your hoodie and get started!

## Prerequisites

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads). This software is used to manage the virtual machines.
2. Install [Python 3](https://www.python.org/downloads/). Make sure that you can execute `python` or `python3` in your terminal.
3. Clone this Git repository into a folder of your choice.

## Getting started

1. **Start your Kali Linux attacker machine**
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
      python3 color-ctf start aqua
      ```
   3. As soon as the vulnerable machine is up and running, the script will provide you with the local IP address.
3. **That's it!**
   You can now use your Kali Linux machine to start scanning for vulnerabilities. Happy hacking!

> When you're done, make sure to stop both machines via `python3 color-ctf stop <machine>`.

## Further reading

- [Command reference](docs/commands.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Hints & walkthroughs](https://github.com/bsamtleben/color-ctf-walkthroughs) 💡

## Machines

|                                          | Machine name | Difficulty | Remarks                   |
|------------------------------------------|--------------|------------|---------------------------|
|                                          | kali         |            | Kali Linux attack machine |
| ![aqua](logo/icons/aqua.svg)             | aqua         | ⭐          |                           |
| ![emerald](logo/icons/emerald.svg)       | emerald      | ⭐          |                           |
| ![cantaloupe](logo/icons/cantaloupe.svg) | cantaloupe   | ⭐⭐         |                           |

## Disclaimer
> All challenges and demonstrated techniques are intended for educational purposes only. The author does not endorse any illegal actions.
