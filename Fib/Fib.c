#include <stdlib.h>
#include <stdio.h>

int fib(int n) {
  switch(n) {
  case 0:
    return 0;
    break;
  case 1:
    return 1;
    break;
  default:
    return fib(n - 2) + fib(n -1);
  }
}

int main(int argc, char *argv[]) {
  int n;
  char* arg1 = argv[1];
  if (arg1 == NULL) {
    n = 10;
  } else {
    n = atoi(arg1);
  }
  printf("%d\n", fib(n));
}
