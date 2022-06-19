#!/usr/bin/env bash

LOGFILE=vagrant.log

declare -A MACHINES
MACHINES[aqua]=192.168.60.2

banner() {

    cat <<EOF

 ██████╗ ██████╗ ██╗      ██████╗ ██████╗      ██████╗████████╗███████╗
██╔════╝██╔═══██╗██║     ██╔═══██╗██╔══██╗    ██╔════╝╚══██╔══╝██╔════╝
██║     ██║   ██║██║     ██║   ██║██████╔╝    ██║        ██║   █████╗
██║     ██║   ██║██║     ██║   ██║██╔══██╗    ██║        ██║   ██╔══╝
╚██████╗╚██████╔╝███████╗╚██████╔╝██║  ██║    ╚██████╗   ██║   ██║
 ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝     ╚═════╝   ╚═╝   ╚═╝

EOF

}

usage() {
    cat <<EOF
There are the following commands:
    status                      - List info about all machines
    start <machine>             - Start a machine
    stop  <machine>             - Stop a machine
    reset <machine>             - Reset a machine

EOF
    list_machines
}

check_prerequisites() {
    if [[ ! "$(which vagrant)" ]]; then
        echo "Error: Could not find vagrant executable."
        echo "Please make sure that Vagrant and VirtualBox are installed and added to the PATH variable."
        exit 1
    fi
}

list_machines() {
    echo "The following machines are available:"
    for m in "${!MACHINES[@]}"; do
        echo "    $m"
    done
}

print_log_notice() {
    echo "You can check the most recent log in: $(pwd)/$LOGFILE"
}

print_machine_startup() {
    cat <<EOF

Your machine is up and running!
IP address: ${MACHINES[$1]}
Happy hacking!
EOF
}

status() {
    MACHINE_STATES=$(vagrant global-status --prune | tr -s " ")

    printf '%-20s %-20s %20s\n'  "Machine" "Status" "IP address"
    echo '--------------------------------------------------------------'
    for m in "${!MACHINES[@]}"; do

        # Get machine properties
        MACHINE_STATE=$(echo "$MACHINE_STATES" | grep " $m " | cut -d " " -f 4)
        MACHINE_IP=${MACHINES[$m]}

        # If there is no state returned by Vagrant, the machine probably was never initialized
        if [[ ! $MACHINE_STATE ]]; then
            MACHINE_STATE="not created"
        fi

        # Only print the IP address when the machine is online to avoid confusion
        if [[ "$MACHINE_STATE" != "running" ]]; then
            MACHINE_IP="-"
        fi

        printf '%-20s %-20s %20s\n'  "$m" "$MACHINE_STATE" "$MACHINE_IP"
    done
}

start() {
    cd machines
    echo "Starting machine $1..."
    echo "This might take a while if you start the machine for the first time or after a reset."
    echo "So don't worry if this screen appears to be stuck..."
    echo "Feel free to grab a coffee and return in a few minutes!"
    vagrant up $1 >$LOGFILE && print_machine_startup $1 && return
    echo "Something went wrong while starting the machine..."
    print_log_notice
}

stop() {
    cd machines
    echo "Stopping machine $1..."
    vagrant halt $1 >$LOGFILE && echo "Machine stopped successfully." && return
    echo "Something went wrong while stopping the machine..."
    print_log_notice
}

reset() {
    stop
    echo "Removing machine $1..."
    vagrant destroy $1 -f >$LOGFILE && echo "Machine removed successfully." && return
    echo "Something went wrong while removing the machine..."
    print_log_notice
}

check_machine_name() {
    if [[ ! "${MACHINES[$1]}" ]]; then
        echo "Invalid machine name provided: $1"
        list_machines
        exit 1
    fi
}

# MAIN
banner
check_prerequisites

case "$1" in
"status")
    status
    ;;
"start")
    check_machine_name "$2"
    start "$2"
    ;;
"stop")
    check_machine_name "$2"
    stop "$2"
    ;;
"reset")
    check_machine_name "$2"
    reset "$2"
    ;;
*)
    usage
    ;;
esac

