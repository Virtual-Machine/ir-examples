; ModuleID = 'c/str_cat.c'
source_filename = "c/str_cat.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [2 x i8] c";\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"world\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Example\00\00", align 1

; Function Attrs: nounwind ssp uwtable
define void @example(i8*, i8**, i64) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8** %1, i8*** %5, align 8
  store i64 %2, i64* %6, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = call i64 @strlen(i8* %10)
  %12 = add i64 %11, 1
  store i64 %12, i64* %7, align 8
  %13 = load i64, i64* %7, align 8
  %14 = call i8* @malloc(i64 %13)
  store i8* %14, i8** %8, align 8
  %15 = load i8*, i8** %8, align 8
  %16 = load i8*, i8** %4, align 8
  %17 = load i64, i64* %7, align 8
  %18 = load i8*, i8** %8, align 8
  %19 = call i64 @llvm.objectsize.i64.p0i8(i8* %18, i1 false)
  %20 = call i8* @__strncat_chk(i8* %15, i8* %16, i64 %17, i64 %19) #4
  store i32 0, i32* %9, align 4
  br label %21

; <label>:21:                                     ; preds = %51, %3
  %22 = load i32, i32* %9, align 4
  %23 = sext i32 %22 to i64
  %24 = load i64, i64* %6, align 8
  %25 = icmp ult i64 %23, %24
  br i1 %25, label %26, label %54

; <label>:26:                                     ; preds = %21
  %27 = load i32, i32* %9, align 4
  %28 = sext i32 %27 to i64
  %29 = load i8**, i8*** %5, align 8
  %30 = getelementptr inbounds i8*, i8** %29, i64 %28
  %31 = load i8*, i8** %30, align 8
  %32 = call i64 @strlen(i8* %31)
  %33 = add i64 1, %32
  %34 = load i64, i64* %7, align 8
  %35 = add i64 %34, %33
  store i64 %35, i64* %7, align 8
  %36 = load i8*, i8** %8, align 8
  %37 = load i64, i64* %7, align 8
  %38 = call i8* @realloc(i8* %36, i64 %37)
  store i8* %38, i8** %8, align 8
  %39 = load i8*, i8** %8, align 8
  %40 = load i64, i64* %7, align 8
  %41 = load i8*, i8** %8, align 8
  %42 = call i64 @llvm.objectsize.i64.p0i8(i8* %41, i1 false)
  %43 = call i8* @__strncat_chk(i8* %39, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i64 %40, i64 %42) #4
  %44 = load i32, i32* %9, align 4
  %45 = sext i32 %44 to i64
  %46 = load i8**, i8*** %5, align 8
  %47 = getelementptr inbounds i8*, i8** %46, i64 %45
  %48 = load i8*, i8** %47, align 8
  %49 = load i64, i64* %7, align 8
  %50 = call i8* @__strncat_chk(i8* %43, i8* %48, i64 %49, i64 -1) #4
  br label %51

; <label>:51:                                     ; preds = %26
  %52 = load i32, i32* %9, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %9, align 4
  br label %21

; <label>:54:                                     ; preds = %21
  %55 = load i8*, i8** %8, align 8
  %56 = call i32 @puts(i8* %55)
  %57 = load i8*, i8** %8, align 8
  call void @free(i8* %57)
  ret void
}

declare i64 @strlen(i8*) #1

declare i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8*, i8*, i64, i64) #2

; Function Attrs: nounwind readnone
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1) #3

declare i8* @realloc(i8*, i64) #1

declare i32 @puts(i8*) #1

declare void @free(i8*) #1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i8**, align 8
  %2 = alloca [2 x i8*], align 8
  %3 = getelementptr inbounds [2 x i8*], [2 x i8*]* %2, i64 0, i64 0
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8** %3, align 8
  %4 = getelementptr inbounds i8*, i8** %3, i64 1
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8** %4, align 8
  %5 = getelementptr inbounds [2 x i8*], [2 x i8*]* %2, i32 0, i32 0
  store i8** %5, i8*** %1, align 8
  %6 = load i8**, i8*** %1, align 8
  call void @example(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8** %6, i64 2)
  ret i32 0
}

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
