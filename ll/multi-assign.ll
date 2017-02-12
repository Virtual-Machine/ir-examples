; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %a = alloca i32
  %b = alloca i32
  %__temp_1 = alloca i32
  %__temp_2 = alloca i32
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  store i32 1, i32* %a
  store i32 2, i32* %b
  %0 = load i32, i32* %b
  store i32 %0, i32* %__temp_1
  %1 = load i32, i32* %a
  store i32 %1, i32* %__temp_2
  %2 = load i32, i32* %__temp_1
  store i32 %2, i32* %a
  %3 = load i32, i32* %__temp_2
  store i32 %3, i32* %b
  ret i32 %3
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
