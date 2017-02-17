; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
entry:
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %0 = call i32 @"*foo:Int32"()
  %1 = call i32 @"*puts<Int32>:Int32"(i32 %0)
  %2 = call i32 @"*great:Int32"()
  %3 = call i32 @"*puts<Int32>:Int32"(i32 %2)
  %4 = call i32 @"*what:Int32"()
  %5 = call i32 @"*puts<Int32>:Int32"(i32 %4)
  ret i32 %5
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal i32 @"*foo:Int32"() #0 {
entry:
  ret i32 1
}

; Function Attrs: uwtable
define internal i32 @"*puts<Int32>:Int32"(i32 %value) #0 {
entry:
  ret i32 %value
}

; Function Attrs: uwtable
define internal i32 @"*great:Int32"() #0 {
entry:
  ret i32 2
}

; Function Attrs: uwtable
define internal i32 @"*what:Int32"() #0 {
entry:
  ret i32 3
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #1

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
