.PHONY: exec clean

NAME=Fib
GENERATED=$(NAME).bc $(NAME).aout $(NAME).c.ll $(NAME).c.aout

all: $(NAME).bc $(NAME).aout $(NAME).c.ll $(NAME).c.aout

exec: $(NAME).bc
	lli $<

%.bc: %.ll
	llvm-as $<

%.s: %.ll
	llc $<

%.aout: %.s
	clang -o $@ $<

%.c.aout: %.c
	clang -o $@ $<

%.c.ll: %.c
	clang -o $@ -S -emit-llvm $<

clean:
	rm -f $(GENERATED)


