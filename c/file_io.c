#include <stdlib.h>
#include <stdio.h>
int main()
{
   int num;
   FILE *fptr;
   fptr = fopen("testfile.txt","w");
   fprintf(fptr,"Hello\nWorld\n");
   fclose(fptr);

   return 0;
}