; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%"(Float64 | Int32)" = type { i32, [1 x i64] }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal double @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %y = alloca %"(Float64 | Int32)"
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %0 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 0
  store i32 11, i32* %0
  %1 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %2 = bitcast [1 x i64]* %1 to i32*
  store i32 0, i32* %2
  %3 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %4 = bitcast [1 x i64]* %3 to i32*
  %5 = load i32, i32* %4
  %6 = add i32 %5, 2
  %7 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 0
  store i32 11, i32* %7
  %8 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %9 = bitcast [1 x i64]* %8 to i32*
  store i32 %6, i32* %9
  %10 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %11 = bitcast [1 x i64]* %10 to i32*
  %12 = load i32, i32* %11
  %13 = mul i32 %12, 4
  %14 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 0
  store i32 11, i32* %14
  %15 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %16 = bitcast [1 x i64]* %15 to i32*
  store i32 %13, i32* %16
  %17 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %18 = bitcast [1 x i64]* %17 to i32*
  %19 = load i32, i32* %18
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 2.000000e+00
  %22 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 0
  store i32 17, i32* %22
  %23 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %24 = bitcast [1 x i64]* %23 to double*
  store double %21, double* %24
  %25 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %26 = bitcast [1 x i64]* %25 to double*
  %27 = load double, double* %26
  %28 = fsub double %27, 4.000000e+00
  %29 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 0
  store i32 17, i32* %29
  %30 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %31 = bitcast [1 x i64]* %30 to double*
  store double %28, double* %31
  %32 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %y, i32 0, i32 1
  %33 = bitcast [1 x i64]* %32 to double*
  %34 = load double, double* %33
  ret double %34
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call double @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #1

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
