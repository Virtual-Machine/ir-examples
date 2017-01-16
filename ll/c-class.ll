; ModuleID = 'c/class.c'
source_filename = "c/class.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct.Date = type { i32, i32, i32 }

@.str = private unnamed_addr constant [9 x i8] c"%d-%d-%d\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Date, align 4
  store i32 0, i32* %1, align 4
  call void @set_date(%struct.Date* %2, i32 5, i32 10, i32 2001)
  call void @print_date(%struct.Date* %2)
  ret i32 0
}

; Function Attrs: nounwind ssp uwtable
define void @set_date(%struct.Date*, i32, i32, i32) #0 {
  %5 = alloca %struct.Date*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.Date* %0, %struct.Date** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %9 = load i32, i32* %6, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %18

; <label>:11:                                     ; preds = %4
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %12, 32
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %11
  %15 = load i32, i32* %6, align 4
  %16 = load %struct.Date*, %struct.Date** %5, align 8
  %17 = getelementptr inbounds %struct.Date, %struct.Date* %16, i32 0, i32 0
  store i32 %15, i32* %17, align 4
  br label %18

; <label>:18:                                     ; preds = %14, %11, %4
  %19 = load i32, i32* %7, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %28

; <label>:21:                                     ; preds = %18
  %22 = load i32, i32* %7, align 4
  %23 = icmp slt i32 %22, 13
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %21
  %25 = load i32, i32* %7, align 4
  %26 = load %struct.Date*, %struct.Date** %5, align 8
  %27 = getelementptr inbounds %struct.Date, %struct.Date* %26, i32 0, i32 1
  store i32 %25, i32* %27, align 4
  br label %28

; <label>:28:                                     ; preds = %24, %21, %18
  %29 = load i32, i32* %8, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %35

; <label>:31:                                     ; preds = %28
  %32 = load i32, i32* %8, align 4
  %33 = load %struct.Date*, %struct.Date** %5, align 8
  %34 = getelementptr inbounds %struct.Date, %struct.Date* %33, i32 0, i32 2
  store i32 %32, i32* %34, align 4
  br label %35

; <label>:35:                                     ; preds = %31, %28
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @print_date(%struct.Date*) #0 {
  %2 = alloca %struct.Date*, align 8
  store %struct.Date* %0, %struct.Date** %2, align 8
  %3 = load %struct.Date*, %struct.Date** %2, align 8
  %4 = getelementptr inbounds %struct.Date, %struct.Date* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  %6 = load %struct.Date*, %struct.Date** %2, align 8
  %7 = getelementptr inbounds %struct.Date, %struct.Date* %6, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = load %struct.Date*, %struct.Date** %2, align 8
  %10 = getelementptr inbounds %struct.Date, %struct.Date* %9, i32 0, i32 2
  %11 = load i32, i32* %10, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 %5, i32 %8, i32 %11)
  ret void
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
