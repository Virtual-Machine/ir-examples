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

define internal %"(Float64 | Int32 | String)" @__crystal_main(i32 %argc, i8** %argv) !dbg !4 {
alloca:
  %a = alloca %Example*, !dbg !9
  %0 = alloca %"(Float64 | Int32 | String)", !dbg !12
  br label %entry

entry:                                            ; preds = %alloca
  store i32 %argc, i32* @ARGC_UNSAFE
  store i8** %argv, i8*** @ARGV_UNSAFE
  %1 = call %Example* @"*Example::new:Example"(), !dbg !13
  store %Example* %1, %Example** %a, !dbg !14
  %2 = load %Example*, %Example** %a, !dbg !12
  %3 = getelementptr inbounds %Example, %Example* %2, i32 0, i32 1, !dbg !12
  %4 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %3, i32 0, i32 0, !dbg !12
  %5 = load i32, i32* %4, !dbg !12
  %6 = icmp eq i32 12, %5, !dbg !12
  br i1 %6, label %then, label %else, !dbg !12

then:                                             ; preds = %entry
  %7 = load %Example*, %Example** %a, !dbg !12
  %8 = getelementptr inbounds %Example, %Example* %7, i32 0, i32 1, !dbg !12
  %9 = bitcast %"(Float64 | Int32)"* %8 to %"(Float64 | Int32 | String)"*, !dbg !12
  br label %exit, !dbg !12

else:                                             ; preds = %entry
  %10 = getelementptr inbounds %"(Float64 | Int32 | String)", %"(Float64 | Int32 | String)"* %0, i32 0, i32 0, !dbg !12
  store i32 1, i32* %10, !dbg !12
  %11 = getelementptr inbounds %"(Float64 | Int32 | String)", %"(Float64 | Int32 | String)"* %0, i32 0, i32 1, !dbg !12
  %12 = bitcast [1 x i64]* %11 to %String**, !dbg !12
  store %String* bitcast ({ i32, i32, i32, [6 x i8] }* @"'Float'" to %String*), %String** %12, !dbg !12
  br label %exit, !dbg !12

exit:                                             ; preds = %else, %then
  %13 = phi %"(Float64 | Int32 | String)"* [ %9, %then ], [ %0, %else ], !dbg !12
  %14 = load %"(Float64 | Int32 | String)", %"(Float64 | Int32 | String)"* %13, !dbg !12
  ret %"(Float64 | Int32 | String)" %14, !dbg !12
}

declare i32 @printf(i8*, ...)

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 !dbg !15 {
entry:
  %0 = call %"(Float64 | Int32 | String)" @__crystal_main(i32 %argc, i8** %argv), !dbg !17
  ret i32 0, !dbg !18
}

; Function Attrs: uwtable
define internal %Example* @"*Example::new:Example"() #0 !dbg !19 {
alloca:
  %_ = alloca %Example*, !dbg !20
  br label %entry

entry:                                            ; preds = %alloca
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%Example* getelementptr (%Example, %Example* null, i32 1) to i32))
  %0 = bitcast i8* %malloccall to %Example*, !dbg !20
  %1 = bitcast %Example* %0 to i8*, !dbg !20
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 ptrtoint (%Example* getelementptr (%Example, %Example* null, i32 1) to i32), i32 4, i1 false), !dbg !20
  %2 = getelementptr inbounds %Example, %Example* %0, i32 0, i32 0, !dbg !20
  store i32 6, i32* %2, !dbg !20
  store %Example* %0, %Example** %_, !dbg !20
  %3 = load %Example*, %Example** %_, !dbg !20
  %4 = call i32 @"*Example#initialize:Int32"(%Example* %3), !dbg !20
  %5 = load %Example*, %Example** %_, !dbg !20
  ret %Example* %5, !dbg !20
}

declare noalias i8* @malloc(i32)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: uwtable
define internal i32 @"*Example#initialize:Int32"(%Example* %self) #0 !dbg !21 {
entry:
  %0 = getelementptr inbounds %Example, %Example* %self, i32 0, i32 1, !dbg !22
  %1 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %0, i32 0, i32 0, !dbg !22
  store i32 12, i32* %1, !dbg !22
  %2 = getelementptr inbounds %"(Float64 | Int32)", %"(Float64 | Int32)"* %0, i32 0, i32 1, !dbg !22
  %3 = bitcast [1 x i64]* %2 to i32*, !dbg !22
  store i32 4, i32* %3, !dbg !22
  %4 = getelementptr inbounds %Example, %Example* %self, i32 0, i32 2, !dbg !23
  store i32 4, i32* %4, !dbg !23
  ret i32 4, !dbg !24
}

; Function Attrs: nounwind
declare void @llvm.stackprotector(i8*, i8**) #2

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3}

!0 = distinct !DICompileUnit(language: 32770, file: !1, producer: "Crystal", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "main_module", directory: ".")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = distinct !DISubprogram(name: "__crystal_main", linkageName: "__crystal_main", scope: !5, file: !5, type: !6, isLocal: true, isDefinition: true, isOptimized: false, unit: !0, variables: !2)
!5 = !DIFile(filename: "??", directory: ".")
!6 = !DISubroutineType(types: !7)
!7 = !{!8}
!8 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!9 = !DILocation(line: 1, column: 1, scope: !10)
!10 = distinct !DILexicalBlock(scope: !4, file: !11, line: 1, column: 1)
!11 = !DIFile(filename: "is_a.cr", directory: "/Users/dwork/DemoProjects/ir-examples/crystal")
!12 = !DILocation(line: 17, column: 1, scope: !10)
!13 = !DILocation(line: 15, column: 5, scope: !10)
!14 = !DILocation(line: 15, column: 1, scope: !10)
!15 = distinct !DISubprogram(name: "main", linkageName: "main", scope: !16, file: !16, line: 8, type: !6, isLocal: true, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!16 = !DIFile(filename: "empty.cr", directory: "/usr/local/Cellar/crystal-lang/0.21.0/src")
!17 = !DILocation(line: 9, column: 3, scope: !15)
!18 = !DILocation(line: 11, column: 3, scope: !15)
!19 = distinct !DISubprogram(name: "new", linkageName: "new", scope: !11, file: !11, line: 4, type: !6, isLocal: true, isDefinition: true, scopeLine: 4, isOptimized: false, unit: !0, variables: !2)
!20 = !DILocation(line: 4, column: 2, scope: !19)
!21 = distinct !DISubprogram(name: "initialize", linkageName: "initialize", scope: !11, file: !11, line: 4, type: !6, isLocal: true, isDefinition: true, scopeLine: 4, isOptimized: false, unit: !0, variables: !2)
!22 = !DILocation(line: 5, column: 3, scope: !21)
!23 = !DILocation(line: 6, column: 3, scope: !21)
!24 = !DILocation(line: 7, column: 4, scope: !21)
