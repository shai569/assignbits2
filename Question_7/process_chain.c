#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid;

    printf("Level 0: Parent Process (PID: %d)\n", getpid());

    pid = fork();

    if (pid < 0) {
        perror("Fork failed");
        exit(1);
    } 
    else if (pid == 0) {
        // Inside Child Process
        printf("Level 1: Child Process (PID: %d, Parent PID: %d)\n", getpid(), getppid());

        pid_t grandchild_pid = fork();

        if (grandchild_pid == 0) {
            // Inside Grandchild Process
            printf("Level 2: Grandchild Process (PID: %d, Parent PID: %d)\n", getpid(), getppid());
            sleep(1);
            exit(0);
        }

        wait(NULL); // Child waits for Grandchild
        exit(0);
    } 
    else {
        // Parent Process
        wait(NULL); // Parent waits for Child
        printf("All processes finished. Chain complete.\n");
    }

    return 0;
}
