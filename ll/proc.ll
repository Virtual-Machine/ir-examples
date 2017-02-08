; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%"->" = type { i8*, i8* }
%closure = type { i32 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %proc = alloca %"->"
  %0 = alloca %"->"
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %1 = bitcast i8* %malloccall to %closure*
  %x = getelementptr inbounds %closure, %closure* %1, i32 0, i32 0
  store i32 0, i32* %x
  %2 = bitcast %closure* %1 to i8*
  %3 = getelementptr inbounds %"->", %"->"* %0, i32 0, i32 0
  store i8* bitcast (i32 (i8*, i32)* @"~procProc(Int32, Int32)@crystal/proc.cr:6" to i8*), i8** %3
  %4 = getelementptr inbounds %"->", %"->"* %0, i32 0, i32 1
  store i8* %2, i8** %4
  %5 = load %"->", %"->"* %0
  store %"->" %5, %"->"* %proc
  %6 = load %"->", %"->"* %proc
  %7 = call %"->" @"*some_proc<&Proc(Int32, Int32)>:Proc(Int32, Int32)"(%"->" %6)
  store %"->" %7, %"->"* %proc
  %8 = load %"->", %"->"* %proc
  %9 = extractvalue %"->" %8, 0
  %10 = extractvalue %"->" %8, 1
  %11 = icmp eq i8* %10, null
  br i1 %11, label %ctx_is_null, label %ctx_is_not_null

ctx_is_null:                                      ; preds = %entry
  %12 = bitcast i8* %9 to i32 (i32)*
  %13 = call i32 %12(i32 1)
  br label %exit

ctx_is_not_null:                                  ; preds = %entry
  %14 = bitcast i8* %9 to i32 (i8*, i32)*
  %15 = call i32 %14(i8* %10, i32 1)
  br label %exit

exit:                                             ; preds = %ctx_is_not_null, %ctx_is_null
  %16 = phi i32 [ %13, %ctx_is_null ], [ %15, %ctx_is_not_null ]
  %17 = load %"->", %"->"* %proc
  %18 = extractvalue %"->" %17, 0
  %19 = extractvalue %"->" %17, 1
  %20 = icmp eq i8* %19, null
  br i1 %20, label %ctx_is_null1, label %ctx_is_not_null2

ctx_is_null1:                                     ; preds = %exit
  %21 = bitcast i8* %18 to i32 (i32)*
  %22 = call i32 %21(i32 10)
  br label %exit3

ctx_is_not_null2:                                 ; preds = %exit
  %23 = bitcast i8* %18 to i32 (i8*, i32)*
  %24 = call i32 %23(i8* %19, i32 10)
  br label %exit3

exit3:                                            ; preds = %ctx_is_not_null2, %ctx_is_null1
  %25 = phi i32 [ %22, %ctx_is_null1 ], [ %24, %ctx_is_not_null2 ]
  %26 = load i32, i32* %x
  ret i32 %26
}

declare i32 @printf(i8*, ...)

declare noalias i8* @malloc(i32)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal i32 @"~procProc(Int32, Int32)@crystal/proc.cr:6"(i8*, i32 %i) #0 {
entry:
  %1 = bitcast i8* %0 to %closure*
  %x = getelementptr inbounds %closure, %closure* %1, i32 0, i32 0
  %2 = bitcast i8* %0 to %closure*
  %3 = load i32, i32* %x
  %4 = add i32 %3, %i
  store i32 %4, i32* %x
  ret i32 %4
}

; Function Attrs: uwtable
define internal %"->" @"*some_proc<&Proc(Int32, Int32)>:Proc(Int32, Int32)"(%"->" %block) #0 {
entry:
  ret %"->" %block
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #1

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
