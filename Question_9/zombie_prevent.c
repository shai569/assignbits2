#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
    int num_children = 3;
    pid_t pids[num_children];

    // Create multiple child processes
    for (int i = 0; i < num_children; i++) {
        pids[i] = fork();

        if (pids[i] == 0) { // Child Process
            printf("[Child] PID %d created. Doing work...\n", getpid());
            sleep(2); // Simulate work
            printf("[Child] PID %d exiting.\n", getpid());
            exit(0);
        }
    }

    // Prevention: Parent process cleans up (reaps) each child
    for (int i = 0; i < num_children; i++) {
        int status;
        pid_t cleaned_pid = waitpid(pids[i], &status, 0); // Reaping the child
        if (cleaned_pid > 0) {
            printf("[Parent] Successfully cleaned up (reaped) Child PID: %d\n", cleaned_pid);
        }
    }

    printf("[Parent] All children reaped. No zombies in the system.\n");
    return 0;
}
