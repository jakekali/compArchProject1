all: jag.out

jag.out: jag.S
	arm-linux-gnueabi-gcc jag.S -o jag.out -static
