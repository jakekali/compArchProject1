 #Makefile
.PHONY: clean

all: jag.out

first.out: jag.S
        arm-linux-gnueabi-gcc $< -o $@ -ggdb3 -static

clean:
        rm -f jag.out