; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%Example = type { i32 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %example = alloca %Example*
  %i = alloca i32
  %v1 = alloca i32
  %v2 = alloca i32
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %0 = call %Example* @"*Example@Reference::new:Example"()
  store %Example* %0, %Example** %example
  %1 = load %Example*, %Example** %example
  store i32 1, i32* %i
  %2 = load i32, i32* %i
  %3 = add i32 %2, 1
  store i32 %3, i32* %v1
  %4 = load i32, i32* %v1
  %5 = call i32 @"*puts<Int32>:Int32"(i32 %4)
  store i32 2, i32* %i
  %6 = load i32, i32* %i
  %7 = add i32 %6, 1
  store i32 %7, i32* %v2
  %8 = load i32, i32* %v2
  %9 = call i32 @"*puts<Int32>:Int32"(i32 %8)
  ret i32 %9
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal %Example* @"*Example@Reference::new:Example"() #0 {
alloca:
  %x = alloca %Example*
  br label %entry

entry:                                            ; preds = %alloca
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %0 = bitcast i8* %malloccall to %Example*
  %1 = bitcast %Example* %0 to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32), i32 4, i1 false)
  %2 = getelementptr inbounds %Example, %Example* %0, i32 0, i32 0
  store i32 6, i32* %2
  store %Example* %0, %Example** %x
  %3 = load %Example*, %Example** %x
  ret %Example* %3
}

declare noalias i8* @malloc(i32)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: uwtable
define internal i32 @"*puts<Int32>:Int32"(i32 %word) #0 {
entry:
  ret i32 %word
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #2

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }
