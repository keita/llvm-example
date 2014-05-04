@MSG = private constant [12 x i8] c"Hello, %s!\0A\00"
@ANONYMOUS = private constant [10 x i8] c"anonymous\00"

declare i32 @printf(i8*, ...)

define i32 @main(i32 %argc, i8** %argv) {
head:
  ; message
  %msg = getelementptr [12 x i8]* @MSG, i32 0, i32 0

  ; name in arguments
  %nameref = alloca i8*
  %input_nameref = getelementptr inbounds i8** %argv, i64 1
  %input_name = load i8** %input_nameref
  store i8* %input_name, i8** %nameref

  ; check the name
  %b = icmp eq i8* %input_name, null
  br i1 %b, label %set_anonymous, label %print

set_anonymous:
  ; set name "anonymous"
  %anonymous = getelementptr [10 x i8]* @ANONYMOUS, i32 0, i32 0
  store i8* %anonymous, i8** %nameref
  br label %print

print:
  ; print the name
  %name = load i8** %nameref
  call i32 (i8*, ...)* @printf(i8* %msg, i8* %name)
  ret i32 0
}
