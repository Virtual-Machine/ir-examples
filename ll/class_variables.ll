; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%Example = type { i32, %String* }
%String = type { i32, i32, i32, i8 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null
@"Example::counter" = internal global i32 0
@"Example::counter:init" = internal global i1 false
@"'First'" = private constant { i32, i32, i32, [6 x i8] } { i32 1, i32 5, i32 5, [6 x i8] c"First\00" }
@"'Second'" = private constant { i32, i32, i32, [7 x i8] } { i32 1, i32 6, i32 6, [7 x i8] c"Second\00" }

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %a = alloca %Example*
  %b = alloca %Example*
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %0 = load i1, i1* @"Example::counter:init"
  br i1 %0, label %initialized, label %not_initialized

initialized:                                      ; preds = %not_initialized, %entry
  %1 = load i1, i1* @"Example::counter:init"
  br i1 %1, label %initialized1, label %not_initialized2

not_initialized:                                  ; preds = %entry
  store i1 true, i1* @"Example::counter:init"
  call void @"~Example::counter:init"()
  br label %initialized

initialized1:                                     ; preds = %not_initialized2, %initialized
  %2 = call %Example* @"*Example::new<String>:Example"(%String* bitcast ({ i32, i32, i32, [6 x i8] }* @"'First'" to %String*))
  store %Example* %2, %Example** %a
  %3 = call %Example* @"*Example::new<String>:Example"(%String* bitcast ({ i32, i32, i32, [7 x i8] }* @"'Second'" to %String*))
  store %Example* %3, %Example** %b
  %4 = call i32 @"*Example::count:Int32"()
  ret i32 %4

not_initialized2:                                 ; preds = %initialized
  store i1 true, i1* @"Example::counter:init"
  call void @"~Example::counter:init"()
  br label %initialized1
}

declare i32 @printf(i8*, ...)

define internal void @"~Example::counter:init"() {
entry:
  ret void
}

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal %Example* @"*Example::new<String>:Example"(%String* %name) #0 {
alloca:
  %_ = alloca %Example*
  br label %entry

entry:                                            ; preds = %alloca
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%Example* getelementptr (%Example, %Example* null, i32 1) to i32))
  %0 = bitcast i8* %malloccall to %Example*
  %1 = bitcast %Example* %0 to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 ptrtoint (%Example* getelementptr (%Example, %Example* null, i32 1) to i32), i32 4, i1 false)
  %2 = getelementptr inbounds %Example, %Example* %0, i32 0, i32 0
  store i32 6, i32* %2
  store %Example* %0, %Example** %_
  %3 = load %Example*, %Example** %_
  %4 = call i32 @"*Example#initialize<String>:Int32"(%Example* %3, %String* %name)
  %5 = load %Example*, %Example** %_
  ret %Example* %5
}

declare noalias i8* @malloc(i32)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: uwtable
define internal i32 @"*Example#initialize<String>:Int32"(%Example* %self, %String* %name) #0 {
entry:
  %0 = getelementptr inbounds %Example, %Example* %self, i32 0, i32 1
  store %String* %name, %String** %0
  %1 = call i32* @"~Example::counter:read"()
  %2 = load i32, i32* %1
  %3 = add i32 %2, 1
  %4 = call i32* @"~Example::counter:read"()
  store i32 %3, i32* %4
  ret i32 %3
}

define internal i32* @"~Example::counter:read"() {
entry:
  %0 = load i1, i1* @"Example::counter:init"
  br i1 %0, label %initialized, label %not_initialized

initialized:                                      ; preds = %not_initialized, %entry
  ret i32* @"Example::counter"

not_initialized:                                  ; preds = %entry
  store i1 true, i1* @"Example::counter:init"
  call void @"~Example::counter:init"()
  br label %initialized
}

; Function Attrs: uwtable
define internal i32 @"*Example::count:Int32"() #0 {
entry:
  %0 = call i32* @"~Example::counter:read"()
  %1 = load i32, i32* %0
  ret i32 %1
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #2

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }
