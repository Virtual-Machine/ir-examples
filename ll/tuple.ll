; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%"Tuple(Int32, String, Char)" = type { i32, %String*, i32 }
%String = type { i32, i32, i32, i8 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null
@"'hello'" = private constant { i32, i32, i32, [6 x i8] } { i32 1, i32 5, i32 5, [6 x i8] c"hello\00" }

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %tuple = alloca %"Tuple(Int32, String, Char)"
  %0 = alloca %"Tuple(Int32, String, Char)"
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %1 = getelementptr inbounds %"Tuple(Int32, String, Char)", %"Tuple(Int32, String, Char)"* %0, i32 0, i32 0
  store i32 1, i32* %1
  %2 = getelementptr inbounds %"Tuple(Int32, String, Char)", %"Tuple(Int32, String, Char)"* %0, i32 0, i32 1
  store %String* bitcast ({ i32, i32, i32, [6 x i8] }* @"'hello'" to %String*), %String** %2
  %3 = getelementptr inbounds %"Tuple(Int32, String, Char)", %"Tuple(Int32, String, Char)"* %0, i32 0, i32 2
  store i32 120, i32* %3
  %4 = load %"Tuple(Int32, String, Char)", %"Tuple(Int32, String, Char)"* %0
  store %"Tuple(Int32, String, Char)" %4, %"Tuple(Int32, String, Char)"* %tuple
  %5 = getelementptr inbounds %"Tuple(Int32, String, Char)", %"Tuple(Int32, String, Char)"* %tuple, i32 0, i32 0
  %6 = load i32, i32* %5
  %7 = getelementptr inbounds %"Tuple(Int32, String, Char)", %"Tuple(Int32, String, Char)"* %tuple, i32 0, i32 1
  %8 = load %String*, %String** %7
  %9 = getelementptr inbounds %"Tuple(Int32, String, Char)", %"Tuple(Int32, String, Char)"* %tuple, i32 0, i32 2
  %10 = load i32, i32* %9
  ret i32 %10
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #1

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
