.PHONY: exec clean

all: HelloWorld.bc HelloWorld.aout HelloWorld.c.aout

exec: HelloWorld.bc
	lli HelloWorld.bc

HelloWorld.bc: HelloWorld.ll
	llvm-as HelloWorld.ll

HelloWorld.s: HelloWorld.ll
	llc HelloWorld.ll

HelloWorld.c.ll: HelloWorld.c
	clang -o HelloWorld.c.ll -S -emit-llvm HelloWorld.c

HelloWorld.aout: HelloWorld.s
	clang -o HelloWorld.aout HelloWorld.s

HelloWorld.c.aout: HelloWorld.c
	clang -o HelloWorld.c.aout HelloWorld.c

clean:
	rm -f HelloWorld.bc HelloWorld.s HelloWorld.c.ll HelloWorld.aout HelloWorld.c.aout
