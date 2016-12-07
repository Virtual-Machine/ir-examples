; Function Attrs: nounwind ssp uwtable
define i32 @addFive(i32) #0 {
  %2 = alloca i32, align 4         ;setup space for integer
  store i32 %0, i32* %2, align 4   ;store called value into %2
  %3 = load i32, i32* %2, align 4  ;load value into %3
  %4 = add nsw i32 %3, 5           ;add numbers with no-signed-wrap into %4 (safety)
  ret i32 %4                       ;return value of addition
}

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4         ;setup space for integer
  %2 = alloca i32, align 4         ;setup space for integer
  store i32 0, i32* %1, align 4    ;store value 0 in %1
  store i32 5, i32* %2, align 4    ;store value 5 in %2
  %3 = load i32, i32* %2, align 4  ;read value 5 from %2 to %3
  %4 = call i32 @addFive(i32 %3)   ;call addFive with value 5 from %3 -> store result in %4
  store i32 %4, i32* %2, align 4   ;store returned value back to %2
  ret i32 0                        ;return 0 from main
}
