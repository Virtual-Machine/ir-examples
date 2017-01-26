#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(){
  const char *x = "hello";
  const char *y = " goodbye";
  size_t message_len = strlen(x) + 1;
  char *message = (char*) malloc(message_len);
  strncat(message, x, message_len);
  message_len += strlen(y);
  message = (char*) realloc(message, message_len);
  strncat(message, y, message_len);
  puts(message);
  free(message);
}