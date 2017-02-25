; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%"(Float64 | Int32 | String)" = type { i32, [1 x i64] }
%Example = type { i32, %"(Float64 | Int32)", i32 }
%"(Float64 | Int32)" = type { i32, [1 x i64] }
%String = type { i32, i32, i32, i8 }

@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null
@"'Float'" = private constant { i32, i32, i32, [6 x i8] } { i32 1, i32 5, i32 5, [6 x i8] c"Float\00" }

define internal %"(Float64 | Int32 | String)" @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %a = alloca %Example*
  %0 = alloca %"(Float64 | Int32 | String)"
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %1 = call %Example* @"*Example::new:Example"()
  store %Example* %1, %Example** %a
  %2 = load %Example*, %Example** %a
  %3 = getelementptr inbounds %Example, %Example* %2, i32 0, i32 1
  %4 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %3, i32 0, i32 0
  %5 = load i32, i32* %4
  %6 = icmp eq i32 12, %5
  br i1 %6, label %then, label %else

then:                                             ; preds = %entry
  %7 = load %Example*, %Example** %a
  %8 = getelementptr inbounds %Example, %Example* %7, i32 0, i32 1
  %9 = bitcast %"(Float64 | Int32)"* %8 to %"(Float64 | Int32 | String)"*
  br label %exit

else:                                             ; preds = %entry
  %10 = getelementptr inbounds %"(Float64 | Int32 | String)", %"(Float64 | Int32 | String)"* %0, i32 0, i32 0
  store i32 1, i32* %10
  %11 = getelementptr inbounds %"(Float64 | Int32 | String)", %"(Float64 | Int32 | String)"* %0, i32 0, i32 1
  %12 = bitcast [1 x i64]* %11 to %String**
  store %String* bitcast ({ i32, i32, i32, [6 x i8] }* @"'Float'" to %String*), %String** %12
  br label %exit

exit:                                             ; preds = %else, %then
  %13 = phi %"(Float64 | Int32 | String)"* [ %9, %then ], [ %0, %else ]
  %14 = load %"(Float64 | Int32 | String)", %"(Float64 | Int32 | String)"* %13
  ret %"(Float64 | Int32 | String)" %14
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call %"(Float64 | Int32 | String)" @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define internal %Example* @"*Example::new:Example"() #0 {
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
  %4 = call i32 @"*Example#initialize:Int32"(%Example* %3)
  %5 = load %Example*, %Example** %_
  ret %Example* %5
}

declare noalias i8* @malloc(i32)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: uwtable
define internal i32 @"*Example#initialize:Int32"(%Example* %self) #0 {
entry:
  %0 = getelementptr inbounds %Example, %Example* %self, i32 0, i32 1
  %1 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %0, i32 0, i32 0
  store i32 12, i32* %1
  %2 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %0, i32 0, i32 1
  %3 = bitcast [1 x i64]* %2 to i32*
  store i32 4, i32* %3
  %4 = getelementptr inbounds %Example, %Example* %self, i32 0, i32 2
  store i32 4, i32* %4
  ret i32 4
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #2

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }
