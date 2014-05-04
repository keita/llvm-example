@MSG = private constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)

define i32 @fib(i32 %n) {
head:
  switch i32 %n, label %otherwise [i32 0, label %fib0 i32 1, label %fib1]

fib0:
  ret i32 0

fib1:
  ret i32 1

otherwise:
  ; fib(n-2)
  %n1 = sub i32 %n, 2
  %val1 = call i32 @fib(i32 %n1)
  ; fib(n-1)
  %n2 = sub i32 %n, 1
  %val2 = call i32 @fib(i32 %n2)
  ; fib(n-2) + fib(n-1)
  %val = add i32 %val1, %val2
  ret i32 %val
}

define i32 @main(i32 %argc, i8** %argv) {
head:
  %nref = alloca i32
  %arg1_ref = getelementptr inbounds i8** %argv, i64 1
  %arg1 = load i8** %arg1_ref
  %b = icmp eq i8* %arg1, null
  br i1 %b, label %set_10, label %set_n

set_n:
  %input = call i32 @atoi(i8* %arg1)
  store i32 %input, i32* %nref
  br label %calc

set_10:
  store i32 10, i32* %nref
  br label %calc

calc:
  %n = load i32* %nref
  %val = call i32 @fib(i32 %n)
  ; print
  %msg = getelementptr [4 x i8]* @MSG, i32 0, i32 0
  call i32 (i8*, ...)* @printf(i8* %msg, i32 %val)
  ret i32 0
}
