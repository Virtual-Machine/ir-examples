; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%IntWrapper = type { i32, i32 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal void @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %wrapper = alloca %IntWrapper*
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %0 = call %IntWrapper* @"*IntWrapper::new<Int32>:IntWrapper"(i32 1)
  store %IntWrapper* %0, %IntWrapper** %wrapper
  %1 = load %IntWrapper*, %IntWrapper** %wrapper
  %2 = getelementptr inbounds %IntWrapper, %IntWrapper* %1, i32 0, i32 1
  %3 = load i32, i32* %2
  call void @exit(i32 %3)
  unreachable
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  call void @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal %IntWrapper* @"*IntWrapper::new<Int32>:IntWrapper"(i32 %value) #0 {
alloca:
  %_ = alloca %IntWrapper*
  br label %entry

entry:                                            ; preds = %alloca
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i64), i64 2) to i32))
  %0 = bitcast i8* %malloccall to %IntWrapper*
  %1 = bitcast %IntWrapper* %0 to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 trunc (i64 mul nuw (i64 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i64), i64 2) to i32), i32 4, i1 false)
  %2 = getelementptr inbounds %IntWrapper, %IntWrapper* %0, i32 0, i32 0
  store i32 6, i32* %2
  store %IntWrapper* %0, %IntWrapper** %_
  %3 = load %IntWrapper*, %IntWrapper** %_
  %4 = call i32 @"*IntWrapper#initialize<Int32>:Int32"(%IntWrapper* %3, i32 %value)
  %5 = load %IntWrapper*, %IntWrapper** %_
  ret %IntWrapper* %5
}

declare noalias i8* @malloc(i32)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: uwtable
define internal i32 @"*IntWrapper#initialize<Int32>:Int32"(%IntWrapper* %self, i32 %value) #0 {
entry:
  %0 = getelementptr inbounds %IntWrapper, %IntWrapper* %self, i32 0, i32 1
  store i32 %value, i32* %0
  ret i32 %value
}

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #3

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noreturn }
attributes #3 = { nounwind }
