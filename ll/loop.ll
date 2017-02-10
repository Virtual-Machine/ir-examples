; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal void @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %num = alloca i32
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  store i32 0, i32* %num
  br label %while

while:                                            ; preds = %body, %entry
  %0 = load i32, i32* %num
  %1 = icmp slt i32 %0, 5
  br i1 %1, label %body, label %exit

body:                                             ; preds = %while
  %2 = load i32, i32* %num
  %3 = add i32 %2, 1
  store i32 %3, i32* %num
  br label %while

exit:                                             ; preds = %while
  ret void
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  call void @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #1

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
