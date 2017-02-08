; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%"->" = type { i8*, i8* }
%closure = type { i32, i32 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %proc = alloca %"->"
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %0 = call %"->" @"*counter<Int32>:Proc(Int32)"(i32 0)
  store %"->" %0, %"->"* %proc
  %1 = load %"->", %"->"* %proc
  %2 = extractvalue %"->" %1, 0
  %3 = extractvalue %"->" %1, 1
  %4 = icmp eq i8* %3, null
  br i1 %4, label %ctx_is_null, label %ctx_is_not_null

ctx_is_null:                                      ; preds = %entry
  %5 = bitcast i8* %2 to i32 ()*
  %6 = call i32 %5()
  br label %exit

ctx_is_not_null:                                  ; preds = %entry
  %7 = bitcast i8* %2 to i32 (i8*)*
  %8 = call i32 %7(i8* %3)
  br label %exit

exit:                                             ; preds = %ctx_is_not_null, %ctx_is_null
  %9 = phi i32 [ %6, %ctx_is_null ], [ %8, %ctx_is_not_null ]
  %10 = load %"->", %"->"* %proc
  %11 = extractvalue %"->" %10, 0
  %12 = extractvalue %"->" %10, 1
  %13 = icmp eq i8* %12, null
  br i1 %13, label %ctx_is_null1, label %ctx_is_not_null2

ctx_is_null1:                                     ; preds = %exit
  %14 = bitcast i8* %11 to i32 ()*
  %15 = call i32 %14()
  br label %exit3

ctx_is_not_null2:                                 ; preds = %exit
  %16 = bitcast i8* %11 to i32 (i8*)*
  %17 = call i32 %16(i8* %12)
  br label %exit3

exit3:                                            ; preds = %ctx_is_not_null2, %ctx_is_null1
  %18 = phi i32 [ %15, %ctx_is_null1 ], [ %17, %ctx_is_not_null2 ]
  ret i32 %18
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal %"->" @"*counter<Int32>:Proc(Int32)"(i32 %num) #0 {
alloca:
  %0 = alloca %"->"
  br label %entry

entry:                                            ; preds = %alloca
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i64), i64 2) to i32))
  %1 = bitcast i8* %malloccall to %closure*
  %x = getelementptr inbounds %closure, %closure* %1, i32 0, i32 0
  %y = getelementptr inbounds %closure, %closure* %1, i32 0, i32 1
  store i32 0, i32* %x
  store i32 %num, i32* %y
  %2 = bitcast %closure* %1 to i8*
  %3 = getelementptr inbounds %"->", %"->"* %0, i32 0, i32 0
  store i8* bitcast (i32 (i8*)* @"~procProc(Int32)@crystal/closure_2.cr:4" to i8*), i8** %3
  %4 = getelementptr inbounds %"->", %"->"* %0, i32 0, i32 1
  store i8* %2, i8** %4
  %5 = load %"->", %"->"* %0
  ret %"->" %5
}

declare noalias i8* @malloc(i32)

; Function Attrs: uwtable
define internal i32 @"~procProc(Int32)@crystal/closure_2.cr:4"(i8*) #0 {
entry:
  %1 = bitcast i8* %0 to %closure*
  %x = getelementptr inbounds %closure, %closure* %1, i32 0, i32 0
  %y = getelementptr inbounds %closure, %closure* %1, i32 0, i32 1
  %2 = bitcast i8* %0 to %closure*
  %3 = load i32, i32* %x
  %4 = add i32 %3, 1
  store i32 %4, i32* %x
  %5 = load i32, i32* %y
  %6 = add i32 %5, 2
  store i32 %6, i32* %y
  %7 = load i32, i32* %x
  %8 = load i32, i32* %y
  %9 = add i32 %7, %8
  ret i32 %9
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #1

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
