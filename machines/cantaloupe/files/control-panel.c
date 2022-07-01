#include <string.h>
#include <unistd.h>

// CONTROL PANEL
// This application can be used to start/stop/restart a limited number of services.

int main(int argc, char* argv[]) {

    // Check for valid number of parameters
    if (argc != 2) {
        return 1;
    }

    // Check which command to execute

    if(strcmp("ftp-start", argv[1]) == 0) {
        // Start FTP server
        execl("/usr/bin/systemctl", "/usr/bin/systemctl", "start", "vsftpd", NULL);
    }
    else if(strcmp("ftp-stop", argv[1]) == 0) {
        // Stop FTP server
        execl("/usr/bin/systemctl", "/usr/bin/systemctl", "stop", "vsftpd", NULL);
    }
    else if(strcmp("web-restart", argv[1]) == 0) {
        // Make sure that all web pages can be served by Apache
        execl("/usr/bin/chown", "/usr/bin/chown", "-RH", "www-data:", "/var/www/html", NULL);
        // Restart web server
        execl("/usr/bin/systemctl", "/usr/bin/systemctl", "restart", "apache2", NULL);
    }
    else if(strcmp("reboot", argv[1]) == 0) {
        // Reboot system
        execl("/usr/sbin/reboot", "/usr/sbin/reboot", NULL);
    }
    else {
        // Unknown command
        return 1;
    }

    return 0;
}
