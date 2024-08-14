declare i32 @printf(i8*, ...) 

@.str = private unnamed_addr constant [13 x i8] c"arg [%d] %s\0A\00", align 1

define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv){
entry:
  br label %loop
loop:
  %i =  phi i32 [ %argc, %entry ], [ %next_i, %loop ]
  %p = phi i8** [ %argv, %entry ], [ %next_p, %loop ]
  %s = load i8*,ptr %p 

  %display =  sub i32 %argc,%i
  %code = call i32 (i8*, ...) @printf(ptr @.str,i32 %display,i8* %s)

  
  %next_i = sub i32 %i, 1
  %next_p = getelementptr i8*, i8** %p, i32 1


  %cond = icmp slt i32 %i, 2
  br i1 %cond, label %end, label %loop

end:
  ret i32 0
}
