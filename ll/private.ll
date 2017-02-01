; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%TestClass = type { i32, %String* }
%String = type { i32, i32, i32, i8 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null
@"'Demo'" = private constant { i32, i32, i32, [5 x i8] } { i32 1, i32 4, i32 4, [5 x i8] c"Demo\00" }

define internal %TestClass* @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %test = alloca %TestClass*
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %0 = call %TestClass* @"*TestClass::new<String>:TestClass"(%String* bitcast ({ i32, i32, i32, [5 x i8] }* @"'Demo'" to %String*))
  store %TestClass* %0, %TestClass** %test
  ret %TestClass* %0
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call %TestClass* @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal %TestClass* @"*TestClass::new<String>:TestClass"(%String* %name) #0 {
alloca:
  %_ = alloca %TestClass*
  br label %entry

entry:                                            ; preds = %alloca
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%TestClass* getelementptr (%TestClass, %TestClass* null, i32 1) to i32))
  %0 = bitcast i8* %malloccall to %TestClass*
  %1 = bitcast %TestClass* %0 to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 ptrtoint (%TestClass* getelementptr (%TestClass, %TestClass* null, i32 1) to i32), i32 4, i1 false)
  %2 = getelementptr inbounds %TestClass, %TestClass* %0, i32 0, i32 0
  store i32 6, i32* %2
  store %TestClass* %0, %TestClass** %_
  %3 = load %TestClass*, %TestClass** %_
  %4 = call i32 @"*TestClass#initialize<String>:Int32"(%TestClass* %3, %String* %name)
  %5 = load %TestClass*, %TestClass** %_
  ret %TestClass* %5
}

declare noalias i8* @malloc(i32)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: uwtable
define internal i32 @"*TestClass#initialize<String>:Int32"(%TestClass* %self, %String* %name) #0 {
entry:
  %0 = getelementptr inbounds %TestClass, %TestClass* %self, i32 0, i32 1
  store %String* %name, %String** %0
  %1 = call i32 @"*TestClass#print<Int32>:Int32"(%TestClass* %self, i32 4)
  ret i32 %1
}

; Function Attrs: uwtable
define internal i32 @"*TestClass#print<Int32>:Int32"(%TestClass* %self, i32 %num) #0 {
entry:
  %0 = add i32 10, %num
  ret i32 %0
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #2

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }
