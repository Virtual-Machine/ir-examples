; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%Test = type { i32 }
%Test2 = type { i32 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %test = alloca %Test*
  %test2 = alloca %Test2*
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %0 = call %Test* @"*Test@Reference::new:Test"()
  store %Test* %0, %Test** %test
  %1 = call %Test2* @"*Test2@Reference::new:Test2"()
  store %Test2* %1, %Test2** %test2
  %2 = load %Test*, %Test** %test
  %3 = call i32 @"*Test#print_num:Int32"(%Test* %2)
  %4 = load %Test2*, %Test2** %test2
  %5 = call i32 @"*Test2@Test#print_num:Int32"(%Test2* %4)
  %6 = call i32 @"*Test2::print_num:Int32"()
  ret i32 %6
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal %Test* @"*Test@Reference::new:Test"() #0 {
alloca:
  %x = alloca %Test*
  br label %entry

entry:                                            ; preds = %alloca
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %0 = bitcast i8* %malloccall to %Test*
  %1 = bitcast %Test* %0 to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32), i32 4, i1 false)
  %2 = getelementptr inbounds %Test, %Test* %0, i32 0, i32 0
  store i32 7, i32* %2
  store %Test* %0, %Test** %x
  %3 = load %Test*, %Test** %x
  ret %Test* %3
}

declare noalias i8* @malloc(i32)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: uwtable
define internal %Test2* @"*Test2@Reference::new:Test2"() #0 {
alloca:
  %x = alloca %Test2*
  br label %entry

entry:                                            ; preds = %alloca
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %0 = bitcast i8* %malloccall to %Test2*
  %1 = bitcast %Test2* %0 to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32), i32 4, i1 false)
  %2 = getelementptr inbounds %Test2, %Test2* %0, i32 0, i32 0
  store i32 6, i32* %2
  store %Test2* %0, %Test2** %x
  %3 = load %Test2*, %Test2** %x
  ret %Test2* %3
}

; Function Attrs: uwtable
define internal i32 @"*Test#print_num:Int32"(%Test* %self) #0 {
entry:
  %0 = call i32 @"*puts<Int32>:Int32"(i32 1)
  ret i32 %0
}

; Function Attrs: uwtable
define internal i32 @"*puts<Int32>:Int32"(i32 %x) #0 {
entry:
  ret i32 %x
}

; Function Attrs: uwtable
define internal i32 @"*Test2@Test#print_num:Int32"(%Test2* %self) #0 {
entry:
  %0 = call i32 @"*puts<Int32>:Int32"(i32 1)
  ret i32 %0
}

; Function Attrs: uwtable
define internal i32 @"*Test2::print_num:Int32"() #0 {
entry:
  %0 = call i32 @"*puts<Int32>:Int32"(i32 2)
  ret i32 %0
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #2

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }
