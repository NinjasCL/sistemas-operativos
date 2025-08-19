// source: https://cs162.org/static/lectures/1.pdf
// build: gcc –o memory memory.c -Wall
// run: ./memory & ./memory
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    
    int *p = malloc(sizeof(int));
    printf("(%d) p: %p\n", getpid(), p);
    
    *p = 0;
    while (1) {
        *p = *p + 1;
        printf("(%d) p: %d\n", getpid(), *p);
    }
    
    return 0;
}