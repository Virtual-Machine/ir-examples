; ModuleID = 'c/switch.c'
source_filename = "c/switch.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [22 x i8] c"%.1lf + %.1lf = %.1lf\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"%.1lf - %.1lf = %.1lf\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"%.1lf * %.1lf = %.1lf\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"%.1lf / %.1lf = %.1lf\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"Error! operator is not correct\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store i32 0, i32* %1, align 4
  store i8 43, i8* %2, align 1
  store double 1.200000e+00, double* %3, align 8
  store double 1.400000e+00, double* %4, align 8
  %5 = load i8, i8* %2, align 1
  %6 = sext i8 %5 to i32
  switch i32 %6, label %35 [
    i32 43, label %7
    i32 45, label %14
    i32 42, label %21
    i32 47, label %28
  ]

; <label>:7:                                      ; preds = %0
  %8 = load double, double* %3, align 8
  %9 = load double, double* %4, align 8
  %10 = load double, double* %3, align 8
  %11 = load double, double* %4, align 8
  %12 = fadd double %10, %11
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), double %8, double %9, double %12)
  br label %37

; <label>:14:                                     ; preds = %0
  %15 = load double, double* %3, align 8
  %16 = load double, double* %4, align 8
  %17 = load double, double* %3, align 8
  %18 = load double, double* %4, align 8
  %19 = fsub double %17, %18
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), double %15, double %16, double %19)
  br label %37

; <label>:21:                                     ; preds = %0
  %22 = load double, double* %3, align 8
  %23 = load double, double* %4, align 8
  %24 = load double, double* %3, align 8
  %25 = load double, double* %4, align 8
  %26 = fmul double %24, %25
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2, i32 0, i32 0), double %22, double %23, double %26)
  br label %37

; <label>:28:                                     ; preds = %0
  %29 = load double, double* %3, align 8
  %30 = load double, double* %4, align 8
  %31 = load double, double* %3, align 8
  %32 = load double, double* %3, align 8
  %33 = fdiv double %31, %32
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0), double %29, double %30, double %33)
  br label %37

; <label>:35:                                     ; preds = %0
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0))
  br label %37

; <label>:37:                                     ; preds = %35, %28, %21, %14, %7
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
