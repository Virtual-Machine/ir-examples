; ModuleID = 'str_cat_simple.c'
source_filename = "str_cat_simple.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c" goodbye\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8** %1, align 8
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i8** %2, align 8
  %5 = load i8*, i8** %1, align 8
  %6 = call i64 @strlen(i8* %5)
  %7 = add i64 %6, 1
  store i64 %7, i64* %3, align 8
  %8 = load i64, i64* %3, align 8
  %9 = call i8* @malloc(i64 %8)
  store i8* %9, i8** %4, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = load i8*, i8** %1, align 8
  %12 = load i64, i64* %3, align 8
  %13 = load i8*, i8** %4, align 8
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false)
  %15 = call i8* @__strncat_chk(i8* %10, i8* %11, i64 %12, i64 %14) #4
  %16 = load i8*, i8** %2, align 8
  %17 = call i64 @strlen(i8* %16)
  %18 = load i64, i64* %3, align 8
  %19 = add i64 %18, %17
  store i64 %19, i64* %3, align 8
  %20 = load i8*, i8** %4, align 8
  %21 = load i64, i64* %3, align 8
  %22 = call i8* @realloc(i8* %20, i64 %21)
  store i8* %22, i8** %4, align 8
  %23 = load i8*, i8** %4, align 8
  %24 = load i8*, i8** %2, align 8
  %25 = load i64, i64* %3, align 8
  %26 = load i8*, i8** %4, align 8
  %27 = call i64 @llvm.objectsize.i64.p0i8(i8* %26, i1 false)
  %28 = call i8* @__strncat_chk(i8* %23, i8* %24, i64 %25, i64 %27) #4
  %29 = load i8*, i8** %4, align 8
  %30 = call i32 @puts(i8* %29)
  %31 = load i8*, i8** %4, align 8
  call void @free(i8* %31)
  ret i32 0
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

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
