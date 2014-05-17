@FORMAT_TIME1 = private constant [12 x i8] c"time1: %Ld\0A\00"
@FORMAT_TIME2 = private constant [12 x i8] c"time2: %Ld\0A\00"
@FORMAT_SUB = private constant [9 x i8] c"sub: %d\0A\00"

declare i64 @llvm.readcyclecounter()
declare i32 @printf(i8*, ...)

define i32 @main(i32 %argc, i8** %argv) {
  ; readcyclecounter
  %time1 = call i64 @llvm.readcyclecounter()
  add i32 1, 2
  %time2 = call i64 @llvm.readcyclecounter()
  %sub = sub i64 %time2, %time1

  ; print
  %format_time1 = getelementptr [12 x i8]* @FORMAT_TIME1, i32 0, i64 0
  %format_time2 = getelementptr [12 x i8]* @FORMAT_TIME2, i32 0, i64 0
  %format_sub = getelementptr [9 x i8]* @FORMAT_SUB, i32 0, i64 0
  call i32 (i8*, ...)* @printf(i8* %format_time1, i64 %time1)
  call i32 (i8*, ...)* @printf(i8* %format_time2, i64 %time2)
  call i32 (i8*, ...)* @printf(i8* %format_sub, i64 %sub)
  ret i32 0
}
