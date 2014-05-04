@MSG = private constant [14 x i8] c"Hello, world!\00"

declare i32 @puts(i8*)

define i32 @main() {
  %msg = getelementptr [14 x i8]* @MSG, i32 0, i32 0
  call i32 @puts(i8* %msg)
  ret i32 0
}
