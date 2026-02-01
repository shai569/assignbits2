#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

// Function to handle specific signals
void handle_signal(int sig) {
    if (sig == SIGINT) {
        printf("\n[Parent] Received SIGINT (Ctrl+C). Handling gracefully...\n");
    } else if (sig == SIGTERM) {
        printf("\n[Parent] Received SIGTERM. Cleaning up and exiting gracefully.\n");
        exit(0);
    }
}

int main() {
    // Register the signal handler
    signal(SIGINT, handle_signal);
    signal(SIGTERM, handle_signal);

    printf("Parent process is running (PID: %d)...\n", getpid());
    printf("Send SIGINT (Ctrl+C) or SIGTERM to see response.\n");

    // Create a child process to send signals after a delay
    pid_t pid = fork();

    if (pid == 0) { // Child Process
        sleep(5);
        printf("[Child] Sending SIGTERM to Parent after 5 seconds...\n");
        kill(getppid(), SIGTERM);
        exit(0);
    } else { // Parent Process
        while (1) {
            // Run indefinitely until SIGTERM is received
            sleep(1);
        }
    }

    return 0;
}
