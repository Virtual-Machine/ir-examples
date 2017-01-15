#include <stdio.h>
 
int main()
{
   int four = 4;
   int more = four + 2;
   int ok_more = more + four;

   if(ok_more - 2 == more || four + 8 == ok_more){
      if(2 + 8 == ok_more / 3){
         puts("Hello 1");
      } else {
         puts("Hello 2");
      }
   } else {
      if(2 + more == 9 / 3){
         puts("Hello 3");
      } else {
         puts("Hello 4");
      }
   }
 
   return 0;
}