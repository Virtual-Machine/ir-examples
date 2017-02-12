; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx"

%String = type { i32, i32, i32, i8 }
%"NamedTuple(name: String, year: Int32)" = type { %String*, i32 }

@"'name'" = private constant { i32, i32, i32, [5 x i8] } { i32 1, i32 4, i32 4, [5 x i8] c"name\00" }
@"'year'" = private constant { i32, i32, i32, [5 x i8] } { i32 1, i32 4, i32 4, [5 x i8] c"year\00" }
@":symbol_table" = global [2 x %String*] [%String* bitcast ({ i32, i32, i32, [5 x i8] }* @"'name'" to %String*), %String* bitcast ({ i32, i32, i32, [5 x i8] }* @"'year'" to %String*)]
@ARGC_UNSAFE = internal global i32 0
@ARGV_UNSAFE = internal global i8** null
@"'Crystal'" = private constant { i32, i32, i32, [8 x i8] } { i32 1, i32 7, i32 7, [8 x i8] c"Crystal\00" }

define internal i32 @__crystal_main(i32 %argc, i8** %argv) {
alloca:
  %tuple = alloca %"NamedTuple(name: String, year: Int32)"
  %0 = alloca %"NamedTuple(name: String, year: Int32)"
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %1 = getelementptr inbounds %"NamedTuple(name: String, year: Int32)", %"NamedTuple(name: String, year: Int32)"* %0, i32 0, i32 0
  store %String* bitcast ({ i32, i32, i32, [8 x i8] }* @"'Crystal'" to %String*), %String** %1
  %2 = getelementptr inbounds %"NamedTuple(name: String, year: Int32)", %"NamedTuple(name: String, year: Int32)"* %0, i32 0, i32 1
  store i32 2011, i32* %2
  %3 = load %"NamedTuple(name: String, year: Int32)", %"NamedTuple(name: String, year: Int32)"* %0
  store %"NamedTuple(name: String, year: Int32)" %3, %"NamedTuple(name: String, year: Int32)"* %tuple
  %4 = getelementptr inbounds %"NamedTuple(name: String, year: Int32)", %"NamedTuple(name: String, year: Int32)"* %tuple, i32 0, i32 0
  %5 = load %String*, %String** %4
  %6 = getelementptr inbounds %"NamedTuple(name: String, year: Int32)", %"NamedTuple(name: String, year: Int32)"* %tuple, i32 0, i32 1
  %7 = load i32, i32* %6
  ret i32 %7
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = call i32 @__crystal_main(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #1

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
