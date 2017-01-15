; ModuleID = 'control_flow.c'
source_filename = "control_flow.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [8 x i8] c"Hello 1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Hello 2\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"Hello 3\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"Hello 4\00", align 1


; int four = 4;
; int more = four + 2;
; int ok_more = more + four;

; if(ok_more - 2 == more || four + 8 == ok_more){
;    if(2 + 8 == ok_more / 3){
;       puts("Hello 1");
;    } else {
;       puts("Hello 2");
;    }
; } else {
;    if(2 + more == 9 / 3){
;       puts("Hello 3");
;    } else {
;       puts("Hello 4");
;    }
; }

; return 0;

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4                   ;store 0 into %1  setting up variables
  store i32 4, i32* %2, align 4                   ;store 4 into %2
  %5 = load i32, i32* %2, align 4                 ;load 4 into %5
  %6 = add nsw i32 %5, 2                          ;add 4 + 2 = 6 into %6
  store i32 %6, i32* %3, align 4                  ;store 6 into %3
  %7 = load i32, i32* %3, align 4                 ;load 6 into %7
  %8 = load i32, i32* %2, align 4                 ;load 4 into %8
  %9 = add nsw i32 %7, %8                         ;add 6 + 4 = 10 into %9
  store i32 %9, i32* %4, align 4                  ;store 10 into %4
  %10 = load i32, i32* %4, align 4                ;load 10 into %10  first if before ||
  %11 = sub nsw i32 %10, 2                        ;sub 10 - 2 = 8 into %11
  %12 = load i32, i32* %3, align 4                ;load 6 into %12
  %13 = icmp eq i32 %11, %12                      ;compare eq 6 and 8
  br i1 %13, label %19, label %14                 ; if true goto %19 else %14

; <label>:14:                                     ; preds = %0   after || in first if
  %15 = load i32, i32* %2, align 4                ;load 4 into %15
  %16 = add nsw i32 %15, 8                        ;add 8 + 4 = 12 into %16
  %17 = load i32, i32* %4, align 4                ;load 10 into %17
  %18 = icmp eq i32 %16, %17                      ;compare eq 12 and 10
  br i1 %18, label %19, label %28                 ; if true goto %19 else %28

; <label>:19:                                     ; preds = %14, %0   first nested if
  %20 = load i32, i32* %4, align 4                ;load 10 into %20
  %21 = sdiv i32 %20, 3                           ;sign div 10 by 3 = 3.33333 into %21
  %22 = icmp eq i32 10, %21                       ;compare eq 10 and 3.33333
  br i1 %22, label %23, label %25                 ; if true goto %23 else %25

; <label>:23:                                     ; preds = %19
                                                  ; print Hello 1
  %24 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  br label %27                                    ; goto 27

; <label>:25:                                     ; preds = %19
                                                  ; print Hello 2
  %26 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0))
  br label %27                                    ; goto 27

; <label>:27:                                     ; preds = %25, %23
  br label %37                                    ; goto 37

; <label>:28:                                     ; preds = %14
  %29 = load i32, i32* %3, align 4                ;load 6 into %29
  %30 = add nsw i32 2, %29                        ;add 2 + 6 = 8 into %30
  %31 = icmp eq i32 %30, 3                        ;compare eq 3 and 8
  br i1 %31, label %32, label %34                 ; if true goto %32 else %34

; <label>:32:                                     ; preds = %28
                                                  ; print Hello 3
  %33 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0))
  br label %36                                    ; goto 36

; <label>:34:                                     ; preds = %28
                                                  ; print Hello 4
  %35 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0))
  br label %36                                    ; goto 36

; <label>:36:                                     ; preds = %34, %32
  br label %37                                    ; goto 37

; <label>:37:                                     ; preds = %36, %27
  ret i32 0                                       ; return 0
}

declare i32 @puts(i8*) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
; ModuleID = 'control_flow.c'
source_filename = "control_flow.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [8 x i8] c"Hello 1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Hello 2\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"Hello 3\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"Hello 4\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 4, i32* %2, align 4
  %5 = load i32, i32* %2, align 4
  %6 = add nsw i32 %5, 2
  store i32 %6, i32* %3, align 4
  %7 = load i32, i32* %3, align 4
  %8 = load i32, i32* %2, align 4
  %9 = add nsw i32 %7, %8
  store i32 %9, i32* %4, align 4
  %10 = load i32, i32* %4, align 4
  %11 = sub nsw i32 %10, 2
  %12 = load i32, i32* %3, align 4
  %13 = icmp eq i32 %11, %12
  br i1 %13, label %19, label %14

; <label>:14:                                     ; preds = %0
  %15 = load i32, i32* %2, align 4
  %16 = add nsw i32 %15, 8
  %17 = load i32, i32* %4, align 4
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %19, label %28

; <label>:19:                                     ; preds = %14, %0
  %20 = load i32, i32* %4, align 4
  %21 = sdiv i32 %20, 3
  %22 = icmp eq i32 10, %21
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %19
  %24 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  br label %27

; <label>:25:                                     ; preds = %19
  %26 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0))
  br label %27

; <label>:27:                                     ; preds = %25, %23
  br label %37

; <label>:28:                                     ; preds = %14
  %29 = load i32, i32* %3, align 4
  %30 = add nsw i32 2, %29
  %31 = icmp eq i32 %30, 3
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %28
  %33 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0))
  br label %36

; <label>:34:                                     ; preds = %28
  %35 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0))
  br label %36

; <label>:36:                                     ; preds = %34, %32
  br label %37

; <label>:37:                                     ; preds = %36, %27
  ret i32 0
}

declare i32 @puts(i8*) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
