; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%String = type { i32, i32, i32, i8 }

@"'hello'" = private constant { i32, i32, i32, [6 x i8] } { i32 1, i32 5, i32 5, [6 x i8] c"hello\00" }
@"'good_bye'" = private constant { i32, i32, i32, [9 x i8] } { i32 1, i32 8, i32 8, [9 x i8] c"good_bye\00" }
@"'next'" = private constant { i32, i32, i32, [5 x i8] } { i32 1, i32 4, i32 4, [5 x i8] c"next\00" }
@":symbol_table" = global [3 x %String*] [%String* bitcast ({ i32, i32, i32, [6 x i8] }* @"'hello'" to %String*), %String* bitcast ({ i32, i32, i32, [9 x i8] }* @"'good_bye'" to %String*), %String* bitcast ({ i32, i32, i32, [5 x i8] }* @"'next'" to %String*)]
@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
entry:
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  ret i32 2
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
