// source: https://cs162.org/static/lectures/1.pdf
// build: gcc –o cpu cpu.c -Wall
// run: ./cpu A & ./cpu B & ./cpu C
#include <stdio.h>

int main(int argc, char *argv[]) {

    char *str = argv[1];
    while (1) {
        printf("%s\n", str);
    }
    
    return 0;
}