; ModuleID = 'hello'
source_filename = "main.ll"

declare i32 @printf(i8*, ...) 

@.str = constant [15 x i8] c"Hello, World!\0A\00"

define i32 @main() {
entry:
  ; Call printf with the "Hello, World!" string
  %code = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0))
  
  ; Return 0 from main
  ret i32 %code
}
