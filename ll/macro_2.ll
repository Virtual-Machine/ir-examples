; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%String = type { i32, i32, i32, i8 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null
@"'We are in normal mo...'" = private constant { i32, i32, i32, [22 x i8] } { i32 1, i32 21, i32 21, [22 x i8] c"We are in normal mode\00" }

define internal %String* @__crystal_main(i32 %argc, i8** %argv) {
entry:
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %0 = call %String* @"*puts<String>:String"(%String* bitcast ({ i32, i32, i32, [22 x i8] }* @"'We are in normal mo...'" to %String*))
  ret %String* %0
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call %String* @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal %String* @"*puts<String>:String"(%String* %value) #0 {
entry:
  ret %String* %value
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #1

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
