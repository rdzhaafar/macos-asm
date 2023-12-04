.PHONY: clean, disassemble, debug

all: main

clean:
	rm -rf main.o main main.dSYM

main.o: main.s
	as -g -o $@ $?

main: main.o
	ld -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -o $@ $?

main.dSYM: main
	dsymutil $?

disassemble: main
	objdump -M intel -d $?

debug: main.dSYM
	lldb --local-lldbinit main

