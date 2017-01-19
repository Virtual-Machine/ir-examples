; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%"(Int32 | Nil)" = type { i32, [1 x i64] }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal %"(Int32 | Nil)" @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %four = alloca i32
  %six = alloca %"(Int32 | Nil)"
  %0 = getelementptr inbounds %"(Int32 | Nil)", %"(Int32 | Nil)"* %six, i32 0, i32 0
  store i32 0, i32* %0
  %1 = getelementptr inbounds %"(Int32 | Nil)", %"(Int32 | Nil)"* %six, i32 0, i32 1
  store [1 x i64] zeroinitializer, [1 x i64]* %1
  %2 = alloca %"(Int32 | Nil)"
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  store i32 4, i32* %four
  %3 = load i32, i32* %four
  %4 = icmp sgt i32 %3, 2
  br i1 %4, label %then, label %else

then:                                             ; preds = %entry
  %5 = load i32, i32* %four
  %6 = call i32 @"*add_2<Int32>:Int32"(i32 %5)
  %7 = getelementptr inbounds %"(Int32 | Nil)", %"(Int32 | Nil)"* %six, i32 0, i32 0
  store i32 11, i32* %7
  %8 = getelementptr inbounds %"(Int32 | Nil)", %"(Int32 | Nil)"* %six, i32 0, i32 1
  %9 = bitcast [1 x i64]* %8 to i32*
  store i32 %6, i32* %9
  br label %exit

else:                                             ; preds = %entry
  br label %exit

exit:                                             ; preds = %else, %then
  %10 = load %"(Int32 | Nil)", %"(Int32 | Nil)"* %six
  %11 = call %"(Int32 | Nil)" @"*puts<(Int32 | Nil)>:(Int32 | Nil)"(%"(Int32 | Nil)" %10)
  store %"(Int32 | Nil)" %11, %"(Int32 | Nil)"* %2
  %12 = load %"(Int32 | Nil)", %"(Int32 | Nil)"* %2
  ret %"(Int32 | Nil)" %12
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call %"(Int32 | Nil)" @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal i32 @"*add_2<Int32>:Int32"(i32 %num) #0 {
entry:
  %0 = add i32 %num, 2
  ret i32 %0
}

; Function Attrs: uwtable
define internal %"(Int32 | Nil)" @"*puts<(Int32 | Nil)>:(Int32 | Nil)"(%"(Int32 | Nil)" %item) #0 {
alloca:
  %item1 = alloca %"(Int32 | Nil)"
  br label %entry

entry:                                            ; preds = %alloca
  store %"(Int32 | Nil)" %item, %"(Int32 | Nil)"* %item1
  %0 = load %"(Int32 | Nil)", %"(Int32 | Nil)"* %item1
  ret %"(Int32 | Nil)" %0
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #1

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
