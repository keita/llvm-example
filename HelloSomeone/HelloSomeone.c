#include <stdio.h>

int main(int argc, char *argv[]) {
  char* name = argv[1];
  if (name == NULL) {
    name = "anonymous";
  }
  printf("Hello, %s!\n", name);
}
