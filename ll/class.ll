; ModuleID = 'class.cpp'
source_filename = "class.cpp"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin16.3.0"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], i32*, i8, [7 x i8], i32*, i32*, i64*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%class.Date = type { i32, i32, i32 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [29 x i8] c"This program was written on \00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"This program was modified on \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_class.cpp, i8* null }]

; Function Attrs: nounwind
define internal void @__cxx_global_var_init() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #2
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: norecurse nounwind
define i32 @main() #3 {
  %retval = alloca i32, align 4
  %today = alloca %class.Date, align 4
  store i32 0, i32* %retval, align 4
  call void @_ZN4DateC1Eiii(%class.Date* %today, i32 1, i32 9, i32 1999)
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i32 0, i32 0))
  call void @_ZN4Date5printEv(%class.Date* %today)
  %call1 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i32 0, i32 0))
  call void @_ZN4Date3setEiii(%class.Date* %today, i32 5, i32 10, i32 1999)
  call void @_ZN4Date5printEv(%class.Date* %today)
  ret i32 0
}

; Function Attrs: nounwind
define void @_ZN4DateC1Eiii(%class.Date* %this, i32 %d, i32 %m, i32 %y) unnamed_addr #0 align 2 {
  %this.addr = alloca %class.Date*, align 8
  %d.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store %class.Date* %this, %class.Date** %this.addr, align 8
  store i32 %d, i32* %d.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %this1 = load %class.Date*, %class.Date** %this.addr, align 8
  %1 = load i32, i32* %d.addr, align 4
  %2 = load i32, i32* %m.addr, align 4
  %3 = load i32, i32* %y.addr, align 4
  call void @_ZN4DateC2Eiii(%class.Date* %this1, i32 %1, i32 %2, i32 %3)
  ret void
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

; Function Attrs: nounwind
define void @_ZN4Date5printEv(%class.Date* %this) #0 align 2 {
  %this.addr = alloca %class.Date*, align 8
  store %class.Date* %this, %class.Date** %this.addr, align 8
  %this1 = load %class.Date*, %class.Date** %this.addr, align 8
  %day = getelementptr inbounds %class.Date, %class.Date* %this1, i32 0, i32 2
  %1 = load i32, i32* %day, align 4
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %1)
  %call2 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %month = getelementptr inbounds %class.Date, %class.Date* %this1, i32 0, i32 1
  %2 = load i32, i32* %month, align 4
  %call3 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call2, i32 %2)
  %call4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %year = getelementptr inbounds %class.Date, %class.Date* %this1, i32 0, i32 0
  %3 = load i32, i32* %year, align 4
  %call5 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call4, i32 %3)
  %call6 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call5, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret void
}

; Function Attrs: nounwind
define void @_ZN4Date3setEiii(%class.Date* %this, i32 %d, i32 %m, i32 %y) #0 align 2 {
  %this.addr = alloca %class.Date*, align 8
  %d.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store %class.Date* %this, %class.Date** %this.addr, align 8
  store i32 %d, i32* %d.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %this1 = load %class.Date*, %class.Date** %this.addr, align 8
  %1 = load i32, i32* %d.addr, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %2, label %6

; <label>:2:                                      ; preds = %0
  %3 = load i32, i32* %d.addr, align 4
  %cmp2 = icmp slt i32 %3, 31
  br i1 %cmp2, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = load i32, i32* %d.addr, align 4
  %day = getelementptr inbounds %class.Date, %class.Date* %this1, i32 0, i32 2
  store i32 %5, i32* %day, align 4
  br label %6

; <label>:6:                                      ; preds = %4, %2, %0
  %7 = load i32, i32* %m.addr, align 4
  %cmp3 = icmp sgt i32 %7, 0
  br i1 %cmp3, label %8, label %12

; <label>:8:                                      ; preds = %6
  %9 = load i32, i32* %m.addr, align 4
  %cmp4 = icmp slt i32 %9, 13
  br i1 %cmp4, label %10, label %12

; <label>:10:                                     ; preds = %8
  %11 = load i32, i32* %m.addr, align 4
  %month = getelementptr inbounds %class.Date, %class.Date* %this1, i32 0, i32 1
  store i32 %11, i32* %month, align 4
  br label %12

; <label>:12:                                     ; preds = %10, %8, %6
  %13 = load i32, i32* %y.addr, align 4
  %cmp5 = icmp sgt i32 %13, 0
  br i1 %cmp5, label %14, label %16

; <label>:14:                                     ; preds = %12
  %15 = load i32, i32* %y.addr, align 4
  %year = getelementptr inbounds %class.Date, %class.Date* %this1, i32 0, i32 0
  store i32 %15, i32* %year, align 4
  br label %16

; <label>:16:                                     ; preds = %14, %12
  ret void
}

; Function Attrs: nounwind
define void @_ZN4DateC2Eiii(%class.Date* %this, i32 %d, i32 %m, i32 %y) unnamed_addr #0 align 2 {
  %this.addr = alloca %class.Date*, align 8
  %d.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store %class.Date* %this, %class.Date** %this.addr, align 8
  store i32 %d, i32* %d.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %this1 = load %class.Date*, %class.Date** %this.addr, align 8
  %1 = load i32, i32* %d.addr, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %2, label %6

; <label>:2:                                      ; preds = %0
  %3 = load i32, i32* %d.addr, align 4
  %cmp2 = icmp slt i32 %3, 31
  br i1 %cmp2, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = load i32, i32* %d.addr, align 4
  %day = getelementptr inbounds %class.Date, %class.Date* %this1, i32 0, i32 2
  store i32 %5, i32* %day, align 4
  br label %6

; <label>:6:                                      ; preds = %4, %2, %0
  %7 = load i32, i32* %m.addr, align 4
  %cmp3 = icmp sgt i32 %7, 0
  br i1 %cmp3, label %8, label %12

; <label>:8:                                      ; preds = %6
  %9 = load i32, i32* %m.addr, align 4
  %cmp4 = icmp slt i32 %9, 13
  br i1 %cmp4, label %10, label %12

; <label>:10:                                     ; preds = %8
  %11 = load i32, i32* %m.addr, align 4
  %month = getelementptr inbounds %class.Date, %class.Date* %this1, i32 0, i32 1
  store i32 %11, i32* %month, align 4
  br label %12

; <label>:12:                                     ; preds = %10, %8, %6
  %13 = load i32, i32* %y.addr, align 4
  %cmp5 = icmp sgt i32 %13, 0
  br i1 %cmp5, label %14, label %16

; <label>:14:                                     ; preds = %12
  %15 = load i32, i32* %y.addr, align 4
  %year = getelementptr inbounds %class.Date, %class.Date* %this1, i32 0, i32 0
  store i32 %15, i32* %year, align 4
  br label %16

; <label>:16:                                     ; preds = %14, %12
  ret void
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #1

; Function Attrs: nounwind
define internal void @_GLOBAL__sub_I_class.cpp() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
