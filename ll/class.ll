; ModuleID = 'c/class.cpp'
source_filename = "c/class.cpp"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin16.3.0"

%class.Date = type { i32, i32, i32 }

; Function Attrs: norecurse nounwind
define i32 @main() #0 {
  %retval = alloca i32, align 4
  %today = alloca %class.Date, align 4
  store i32 0, i32* %retval, align 4
  call void @_ZN4DateC1Eiii(%class.Date* %today, i32 1, i32 9, i32 1999)
  call void @_ZN4Date3setEiii(%class.Date* %today, i32 5, i32 10, i32 1999)
  ret i32 0
}

; Function Attrs: nounwind
define void @_ZN4DateC1Eiii(%class.Date* %this, i32 %d, i32 %m, i32 %y) unnamed_addr #1 align 2 {
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

; Function Attrs: nounwind
define void @_ZN4Date3setEiii(%class.Date* %this, i32 %d, i32 %m, i32 %y) #1 align 2 {
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
define void @_ZN4DateC2Eiii(%class.Date* %this, i32 %d, i32 %m, i32 %y) unnamed_addr #1 align 2 {
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

attributes #0 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
