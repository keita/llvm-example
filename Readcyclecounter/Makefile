.PHONY: exec clean

NAME=Readcyclecounter
GENERATED=$(NAME).bc $(NAME).aout

all: $(NAME).bc $(NAME).aout

exec: $(NAME).bc
	lli $<

%.bc: %.ll
	llvm-as $<

%.s: %.ll
	llc $<

%.aout: %.s
	clang -o $@ $<

clean:
	rm -f $(GENERATED)

